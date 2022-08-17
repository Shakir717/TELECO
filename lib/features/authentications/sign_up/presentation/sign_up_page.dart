import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/features/authentications/sign_in/presentation/sign_in_page.dart';
import 'package:telfoni/features/authentications/verificaton/presentation/verifications.dart';
import 'package:telfoni/shared_widgets/alert_dialogs.dart';
import 'package:telfoni/shared_widgets/custom_elevated_button.dart';
import 'package:telfoni/shared_widgets/custom_textfield.dart';
import '../../../../constants/string_values.dart';
import '../../../../routing/app_router.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);

  TextEditingController
  firstName=TextEditingController(),
  lastName=TextEditingController(),
      email=TextEditingController(),
      enterAddress=TextEditingController(),
  country=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController city=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      height:MediaQuery.of(context).size.height/1.5,
      color: kWhite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gapH24,
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(Strings.registration,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
            gapH12,
            Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.alreadyHaveAnAccount,
                          style: theme.textTheme.caption!.copyWith(color: kBlack),
                        ),
                        TextSpan(
                          recognizer:TapGestureRecognizer()..onTap=(){
                            Navigator.of(context).pop();
                            widgetClassDialog(context: context, title: '', content: SignInPage());
                          },
                          text: Strings.signIn,
                          style: theme.textTheme.headline6!.copyWith(color: kBlack,fontWeight: FontWeight.w600),
                        )
                      ]
                  )),
            ),
            gapH32,
            CustomTextField(
              prefixIcon: Icon(Icons.person,color: kLightBlueOpacity08,),
              controller:firstName,
              text: Strings.firstName,
            ),
            gapH16,
            CustomTextField(
              prefixIcon: Icon(Icons.person,color: kLightBlueOpacity08,),
              controller:lastName,
              text: Strings.lastName,
            ),
            gapH16,
            CustomTextField(
                prefixIcon: Icon(Icons.email,color: kLightBlueOpacity08,),
                controller: email,
                text: Strings.enterEmail
            ),
            gapH16,
            CountryStateCityPicker(
              country: country,
              state: state,
              city: city,

              textFieldInputBorder: UnderlineInputBorder(),
            ),
            gapH16,
            CustomTextField(
              maxLine: 2,
              controller: enterAddress,
              text:Strings.enterAddress,
            ),
            gapH32,
            CustomElevatedButton(
                width: double.maxFinite,
                onPress: (){
                  Navigator.of(context).pop();
                  widgetClassDialog(context: context,
                     title: '',
                      content: Verifications()
                  );
                 // context.pushNamed(AppRoute.verification.name);
                  }, text: Strings.continueText),
            SocialLogins(theme: theme),
          ],
        ),
      ),
    );

  }
}
