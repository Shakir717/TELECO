import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/routing/app_router.dart';
import 'package:telfoni/shared_widgets/alert_dialogs.dart';

import '../../../../constants/app_size.dart';
import '../../../../constants/colors_data.dart';
import '../../../../constants/string_values.dart';
import '../../../../shared_widgets/appBar.dart';
import '../../../../shared_widgets/custom_elevated_button.dart';
import '../../../../shared_widgets/custom_textfield.dart';
class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final email=TextEditingController();

  final phone=TextEditingController();

  bool isEmail=false,isPhone=false;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      color: kWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gapH24,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.resetLink,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
          gapH16,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.pleaseSetWhereToSentResetLink,style: theme.textTheme.caption!.copyWith(color: kBlack),)),
          gapH48,
          Container(
              color:isEmail? kLightBlueOpacity08.withOpacity(.2):kWhite,
              child: CustomTextField(
                  onTap: (){
                    setState((){
                      isEmail=true;
                      isPhone=false;
                    });
                  },
                  readOnly: true,prefixIcon: Icon(Icons.mail_rounded,color: kLightBlueOpacity08,),controller: email..text='mal******.com', text: Strings.email)),
          gapH20,
          Container(
              color:isPhone? kLightBlueOpacity08.withOpacity(.2):kWhite,
              child: CustomTextField(
                  onTap: (){
                    setState((){
                      isEmail=false;
                      isPhone=true;
                    });
                  },
                  readOnly: true,prefixIcon: Icon(Icons.phone_android,color: kLightBlueOpacity08,),controller: phone..text='+92*******0', text: Strings.phone)),
          gapH20,
          gapH20,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: (){
                if(isEmail ||isPhone){
                  Navigator.of(context).pop();
                  openDialog(context: context, title: Strings.resetLink,
                      content:Text('Reset link send to you email address  please check inbox',style: theme.textTheme.caption!.copyWith(color: kBlack),),
                      defaultActionText: 'Back',
                  );
                }
              },
              text: Strings.continueText),
        ],),
    );
  }
}
