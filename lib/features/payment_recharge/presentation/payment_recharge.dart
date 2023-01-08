import 'package:flutter/material.dart';
import 'package:teleco/features/invoice/presentation/invoice.dart';
import 'package:teleco/shared_widgets/alert_dialogs.dart';
import 'package:teleco/shared_widgets/custom_elevated_button.dart';
import 'package:teleco/shared_widgets/custom_textfield.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_size.dart';
import '../../../constants/colors_data.dart';
import '../../../constants/common_data.dart';
import '../../../constants/string_values.dart';
import '../../../extensions/color_extension.dart';
import '../../../shared_widgets/custom_card_view.dart';
import '../../../shared_widgets/custom_dropdown_button.dart';
import '../../../shared_widgets/custom_image.dart';
import '../../../shared_widgets/custom_scaffold_widget.dart';
import '../../home/presentation/home_page.dart';

class PaymentAndRecharge extends StatelessWidget {
   PaymentAndRecharge({Key? key}) : super(key: key);

  final number=TextEditingController(),
   enterNumber=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _simCardHeading(theme),
                gapH32,
                Align(
                    alignment: Alignment.center,
                    child: Text(Strings.ourBundles,style: theme.textTheme.headline4,)),

                gapH16,
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: .67,
                      mainAxisSpacing: 12,crossAxisSpacing: 12

                  ),
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: bundlesList.map((e){
                    return  Container(
                      color: kDarkBlue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              color: kLightBlue,
                              height:50,
                              child: Center(child: Text(e.price!,style: theme.textTheme.headline5!.copyWith(color: kBlack),))),
                          gapH8,
                          Text(e.days!,style: theme.textTheme.headline6,),
                          gapH4,
                          Text(Strings.duration,style: theme.textTheme.caption,),
                          gapH8,
                          Divider(color: kLightBlueOpacity08,
                            indent: 40,
                            endIndent: 40,
                          ),
                          gapH8,
                          Text(e.mbs!,style: theme.textTheme.headline6,),
                          gapH4,
                          Text(Strings.internet,style: theme.textTheme.caption,),
                          gapH8,
                          Divider(color: kLightBlueOpacity08,
                            indent: 40,
                            endIndent: 40,
                          ),
                          gapH8,
                          Text(e.sharing!,style: theme.textTheme.headline6,),
                          gapH4,
                          Text(Strings.sharing,style: theme.textTheme.caption,),
                          gapH16,
                        ],),
                    );
                  }).toList(),

                ),
                gapH16,
                CustomCard(
                    padding: 10,
                    child: Row(children: [
                  Column(children: [
                    Text(Strings.boostBundle1GB,style: theme.textTheme.headline5,),
                    Text(Strings.boostYourSpeedNow,)
                  ],),
                      Spacer(),
                      Text('\u{20AC} 6.95',style: theme.textTheme.headline5,)
                ],)
                ),
                gapH20,
                CustomCard(
                  borderColor: kLightBlueOpacity08,
                    padding: 8,
                    child:Column(children: [
                      gapH12,
                      Text(Strings.purchaseNow,style: theme.textTheme.headline5,),
                      gapH16,
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(Strings.telecoGlobaliccidNumber)),
                      gapH20,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              width: 100,
                              child: CustomTextField(labelColor: kWhite,textColor: kWhite,controller: number..text='894301', text:'number')),
                          Expanded(
                              child: CustomTextField(labelColor: kWhite,textColor: kWhite,controller: enterNumber, text:'Enter number here'))
                        ],
                      ),
                      gapH32,
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(Strings.selectBundle)),
                      gapH8,
                      CustomDropDownButton(items: dropDownBundle, title: 'Select Bundle',),
                      gapH16,
                    ],)
                ),
                gapH48,
                CustomCard(
                  width: double.maxFinite,
                    height: 55,
                    borderColor: kLightBlueOpacity08,
                    child: Center(child: Text('+  Add another number'))),
                gapH16,
                CustomElevatedButton(
                    style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(kLightBlueOpacity08)),
                    width: double.maxFinite,onPress: (){
                      widgetClassDialog(
                          context: context,
                          title: '',
                          content:Invoice());
                }, text:'Activate'),
                gapH32,
              ],
            ),
      ),
            HeaderWidget(theme: theme),
          ],
        ),
      ),
    );
  }
  Stack _simCardHeading(ThemeData theme) {
    return Stack(
      children: [
        CustomCard(
          color:HexColor.fromHex('#1C608B'),
          borderRadius: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapW12,
              CustomImage(imageUrl: AppAsset.simChipBanner,),
              Spacer(),
              CustomImage(imageUrl: AppAsset.simChipBanner),
              gapW12,
            ],),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH16,
            SizedBox(width: double.maxFinite,),
            Text(Strings.paymentAndRecharge,style: theme.textTheme.headline6,),
          ],
        )
      ],
    );
  }

}
