import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:telfoni/constants/app_assets.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/constants/string_values.dart';
import 'package:telfoni/shared_widgets/alert_dialogs.dart';
import '../../../../shared_widgets/custom_elevated_button.dart';
import '../../../../shared_widgets/custom_image.dart';
import '../../set_password/presentation/set_password.dart';

class Verifications extends StatefulWidget {
  Verifications({Key? key}) : super(key: key);

  @override
  State<Verifications> createState() => _VerificationsState();
}

class _VerificationsState extends State<Verifications> {
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController=StreamController<ErrorAnimationType>();
  bool hasError = false,enabled=false;

  String currentText = "";


  late Timer _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        }));
  }

  @override
  void dispose() {
    _timer.cancel();
    errorController.close();
    super.dispose();
  }


  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      color: kWhite,
      padding: EdgeInsets.only(left:15,right: 15,bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH24,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.verification,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
          gapH16,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.pleaseEnter4DigitCode,style: theme.textTheme.caption!.copyWith(color: kBlack),)),
          gapH32,
          Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  textStyle: TextStyle(color: kBlack),
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  //obscuringCharacter: '*',
                  // obscuringWidget:const Text('*',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.none,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: kBlack,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: kWhite,
                      activeFillColor: kLightBlueOpacity02,

                      inactiveColor: kBlack,
                      selectedFillColor: kWhite,
                      selectedColor: kBlack
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  backgroundColor: kWhite,
                  onCompleted: (v)async{
                    debugPrint("Completed");
                  },

                  onChanged: (value) {

                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
          ),
          if(hasError) Text(Strings.envalidOtp,style: theme.textTheme.headline5!.copyWith(color: kRed),),
          gapH20,
          RichText(text: TextSpan(
              children:[
                if(_start>1)
                  TextSpan(
                    text: Strings.resendIn,
                    style:theme.textTheme.headline6!.copyWith(color: kBlack,fontWeight: FontWeight.w400),
                  ),

                if(_start>1)
                  TextSpan(
                    text: _start.toString()+'s',
                    style:theme.textTheme.headline6!.copyWith(color: kBlack,fontWeight: FontWeight.bold),
                  ),

                if(_start<1)
                  TextSpan(
                    text: ' Resend',
                    style:theme.textTheme.headline5!.copyWith(color: kBlack,fontWeight: FontWeight.bold),
                  ),
              ]
          )),
          gapH32,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: ()async{
                if(enabled){
                  await openDialog(context: context,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapH20,
                          Center(child: CustomImage(imageUrl: AppAsset.verify,)),
                          gapH20,
                          Text(Strings.verified,style: theme.textTheme.headline4!.copyWith(color: Colors.green),),
                          gapH20,
                          Text(Strings.emailverifiedSccussMessage,style: theme.textTheme.caption!.copyWith(color: kBlack),textAlign: TextAlign.center,)
                        ],),
                      title: '',
                      defaultActionText: Strings.setPassword,

                  );
                  Navigator.of(context).pop();
                  widgetClassDialog(context: context,
                      title: '',
                      content: SetPassword());
                }

                formKey.currentState!.validate();
                // conditions for validating
                if (currentText.length != 6 || currentText != "123456") {
                  errorController.add(ErrorAnimationType
                      .shake); // Triggering error shake animation
                  setState((){
                    hasError = true;
                    enabled=true;
                  });
                } else {
                  setState(
                        () {
                      hasError = false;
                      enabled=false;
                      //snackBar("OTP Verified!!");
                    },
                  );
                }


              }, text: Strings.continueText),
          gapH20,
          Text(Strings.changeEmail,style: theme.textTheme.headline6!.copyWith(color: kBlack),),
        ],),
    );
  }
}
