import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/features/authentications/rese_password/presentation/reset_password.dart';
import 'package:telfoni/routing/app_router.dart';
import 'package:telfoni/shared_widgets/alert_dialogs.dart';

import '../../../../constants/app_size.dart';
import '../../../../constants/colors_data.dart';
import '../../../../constants/string_values.dart';
import '../../../../shared_widgets/appBar.dart';
import '../../../../shared_widgets/custom_elevated_button.dart';
import '../../../../shared_widgets/custom_textfield.dart';
class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({Key? key}) : super(key: key);

  final email=TextEditingController();

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
              child: Text(Strings.forgotPassword,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
          gapH16,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.pleaseEnterDetailsBelow,style: theme.textTheme.caption!.copyWith(color: kBlack),)),
          gapH48,
          CustomTextField(prefixIcon: Icon(Icons.mail_rounded,color: kLightBlueOpacity08,),controller: email, text: Strings.enterEmail),
          gapH20,
          gapH20,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: (){
                Navigator.of(context).pop();

                widgetClassDialog(
                    context: context,
                    title: '',
                    content: ResetPasswordPage()
                );
              //  context.pushNamed(AppRoute.resetpassword.name);
              },
              text: Strings.continueText),
        ],),
    );
  }

}
