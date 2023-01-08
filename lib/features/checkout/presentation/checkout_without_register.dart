import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/colors_data.dart';
import 'package:teleco/constants/string_values.dart';
import 'package:teleco/features/checkout/presentation/payment.dart';
import 'package:teleco/routing/app_router.dart';
import 'package:teleco/shared_widgets/alert_dialogs.dart';
import 'package:teleco/shared_widgets/custom_elevated_button.dart';
import 'package:teleco/shared_widgets/custom_textfield.dart';
import '../../../constants/app_size.dart';
import '../../authentications/sign_in/presentation/sign_in_page.dart';

class CheckoutWithoutRegistration extends StatelessWidget {
   CheckoutWithoutRegistration({Key? key}) : super(key: key);

  final _email=TextEditingController(),
      _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      width: double.maxFinite,
      color: kWhite,
      child: Column(
        children: [

          gapH20,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.registerForTelifoni,style: theme.textTheme.headline6!.copyWith(color: kBlack),)),
          gapH32,
          Align(
              alignment: Alignment.bottomLeft,
              child:Text(Strings.createYourPasswordNow,style: theme.textTheme.caption!.copyWith(color: kBlack),)),
          gapH20,
          CustomTextField(prefixIcon: Icon(Icons.email,color: kLightBlueOpacity08,),controller: _email, text: Strings.enterEmail),
          gapH16,
          CustomTextField(prefixIcon: Icon(Icons.lock,color: kLightBlueOpacity08,),controller: _password, text: Strings.enterPassword),
          gapH32,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: (){
                Navigator.pop(context);
                widgetClassDialog(context: context,
                    title: '',
                    content: PaymentMethodWidget());
                }, text:Strings.login
          ),
          SocialLogins(theme: theme),
          gapH20,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Divider(color: kNavyBlue,)),
              gapW12,
              Text('OR',style: theme.textTheme.caption!.copyWith(color: kBlack),),
              gapW12,
              Expanded(child:  Divider(color: kNavyBlue,)),
            ],),
          gapH20,
          OutlinedButton(
              style: theme.outlinedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(kWhite),shadowColor: MaterialStateProperty.all(kWhite),),
              onPressed: (){
            Navigator.pop(context);
            widgetClassDialog(context: context,
                title: '',
                content: PaymentMethodWidget());
            //context.pushNamed(AppRoute.bundles.name);
          }, child:Text(Strings.checkWithoutRegister,style: theme.textTheme.caption!.copyWith(color: kBlack,fontWeight: FontWeight.w600),))
        ],),
    );
  }
}
