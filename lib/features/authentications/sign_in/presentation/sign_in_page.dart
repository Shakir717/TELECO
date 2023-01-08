import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/app_assets.dart';
import 'package:teleco/constants/colors_data.dart';
import 'package:teleco/constants/string_values.dart';
import 'package:teleco/extensions/color_extension.dart';
import 'package:teleco/features/authentications/forgot_password/presentation/forgot_password_page.dart';
import 'package:teleco/features/authentications/sign_up/presentation/sign_up_page.dart';
import 'package:teleco/shared_widgets/alert_dialogs.dart';
import 'package:teleco/shared_widgets/custom_elevated_button.dart';
import 'package:teleco/shared_widgets/custom_textfield.dart';

import '../../../../constants/app_size.dart';
class SignInPage extends StatelessWidget {
   SignInPage({Key? key}) : super(key: key);
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
              child: Text(Strings.login,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
          gapH20,
          Align(
            alignment: Alignment.bottomLeft,
            child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: Strings.doNotHaveAccount,
                        style: theme.textTheme.caption!.copyWith(color: kBlack),
                      ),
                      TextSpan(
                        recognizer:TapGestureRecognizer()..onTap=(){
                          Navigator.of(context).pop();
                          widgetClassDialog(context: context, title: '', content: SignUpPage());
                          //context.pushNamed(AppRoute.signup.name)
                        },
                        text: Strings.registerNow,
                        style: theme.textTheme.headline6!.copyWith(color: kBlack,fontWeight: FontWeight.w600),
                      )
                    ]
                )),
          ),
          gapH32,
          CustomTextField(prefixIcon: Icon(Icons.email,color: kLightBlueOpacity08,),controller: _email, text: Strings.enterEmail),
          gapH16,
          CustomTextField(prefixIcon: Icon(Icons.lock,color: kLightBlueOpacity08,),controller: _password, text: Strings.enterPassword),
          gapH8,
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
              widgetClassDialog(
                  context: context,
                  title: '',
                  content: ForgotPasswordPage());

             // context.pushNamed(AppRoute.forgotpassword.name);
              },
            child: Align(
                alignment: Alignment.bottomRight,
                child:Text(Strings.ifForgotPassword,style: theme.textTheme.caption!.copyWith(color: kRed,fontWeight: FontWeight.w600),)),
          ),
          gapH48,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: (){ Navigator.of(context).pop();}, text:Strings.login),
          SocialLogins(theme: theme)
        ],),
    );
  }
}

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      gapH48,
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Divider(color: kNavyBlue,)),
          gapW12,
          Text('OR',style: theme.textTheme.caption!.copyWith(color: kBlack),),
          gapW12,
          Expanded(child:  Divider(color: kNavyBlue,)),
        ],),
      gapH48,
      SizedBox(
        width: double.maxFinite,
        child:ElevatedButton.icon(
          style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(HexColor.fromHex('#FDECEB'))),
          onPressed:(){

          },
          icon: Image.asset(AppAsset.google),
          label:Text('  Sign in with Google',style: theme.textTheme.headline6!.copyWith(color: HexColor.fromHex('#7A7A7A'),fontSize: 14),),
        ),
      ),
      gapH16,
      SizedBox(
        width: double.maxFinite,
        child:ElevatedButton.icon(
          style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(HexColor.fromHex('#F0F0F0'))),
          onPressed:(){},
          icon: FaIcon(FontAwesomeIcons.apple,color: kNavyBlue,),
          label:Text('  Sign in with Apple',style: theme.textTheme.headline6!.copyWith(color: HexColor.fromHex('#7A7A7A'),fontSize: 14),),
        ),
      ),
    ],);
  }
}
