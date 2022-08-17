import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/routing/app_router.dart';
import 'package:telfoni/shared_widgets/custom_textfield.dart';

import '../../../../constants/app_size.dart';
import '../../../../constants/colors_data.dart';
import '../../../../constants/string_values.dart';
import '../../../../shared_widgets/appBar.dart';
import '../../../../shared_widgets/custom_elevated_button.dart';

class SetPassword extends StatelessWidget {
   SetPassword({Key? key}) : super(key: key);

  final password=TextEditingController(),
  confirmPassword=TextEditingController();

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
              child: Text(Strings.password,style: theme.textTheme.headline4!.copyWith(color: kBlack),)),
          gapH16,
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(Strings.createYourPasswordNow,style: theme.textTheme.caption!.copyWith(color: kBlack),)),
          gapH48,
          CustomTextField(prefixIcon: Icon(Icons.lock,color: kLightBlueOpacity08,),controller: password, text: Strings.enterPassword),
          gapH20,
          CustomTextField(prefixIcon: Icon(Icons.lock,color: kLightBlueOpacity08,),controller: confirmPassword, text: Strings.confirmPassword),
          gapH20,
          gapH20,
          CustomElevatedButton(
              width: double.maxFinite,
              onPress: (){
               Navigator.of(context).pop();
               // context.goNamed(AppRoute.home.name);
              },
              text: Strings.continueText),
          gapH48,
        ],),
    );
  }

}
