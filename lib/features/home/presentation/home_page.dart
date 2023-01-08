import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/app_assets.dart';
import 'package:teleco/constants/app_size.dart';
import 'package:teleco/constants/colors_data.dart';
import 'package:teleco/constants/common_data.dart';
import 'package:teleco/routing/app_router.dart';
import 'package:teleco/shared_widgets/custom_card_view.dart';
import 'package:teleco/shared_widgets/custom_carousel.dart';
import 'package:teleco/shared_widgets/custom_image.dart';
import 'package:teleco/shared_widgets/custom_scaffold_widget.dart';
import '../../../constants/string_values.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('en'));
    final theme=Theme.of(context);
    return CustomScaffoldWidget(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                gapH20,
                SizedBox(width: double.maxFinite,),
                Text(Strings.welcomeTo,style: theme.textTheme.headline5,),
                gapH12,
                Text(Strings.telecoMobile,style: theme.textTheme.headline3,),
                gapH16,
                CarouselCustomWidget(widgets:introSlider.map<Widget>((e) => _sliderWidget(e)).toList()),
                gapH24,

                /// quick recharge
                CustomTapAbleCard(
                    onTap: (){context.pushNamed(AppRoute.paymentandrecharge.name);},
                    child: Row(
                      children: [
                        CustomImage(imageUrl: AppAsset.recharge),
                        gapW12,
                        Text(Strings.quickRecharge,style: theme.textTheme.headline5,),
                      ],)),
                gapH12,
                ///buy new sim card
                CustomTapAbleCard(
                    onTap: (){
                      context.pushNamed(AppRoute.buynewsimcard.name);
                    },
                    child: Row(children: [
                      CustomImage(imageUrl: AppAsset.simChip),
                      gapW12,
                      Text(Strings.buyNewSimCard,style: theme.textTheme.headline5,),
                    ],)),
                gapH16,
                Row(
                  children: [
                    Expanded(
                      child:SizedBox(
                        height: 100,
                        child: CustomTapAbleCard(
                            onTap: (){context.pushNamed(AppRoute.productlistpage.name);},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage(AppAsset.shopIcon,),color:kLightBlue.withOpacity(.8),),
                                gapH8,
                                Text(Strings.shop,style: theme.textTheme.caption!.copyWith(color:kLightBlue.withOpacity(.8) ),),
                              ],)),
                      ),
                    ),
                    gapW8,
                    Expanded(
                      child:SizedBox(
                        height: 100,
                        child: CustomTapAbleCard(
                            onTap: (){context.pushNamed(AppRoute.paymentandrecharge.name);},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage(AppAsset.cardIcon),color: kLightBlueOpacity08,),
                                gapH8,
                                Text(Strings.paymentRecharge,style: theme.textTheme.caption!.copyWith(color: kLightBlueOpacity08),),
                              ],)
                        ),
                      ),
                    )
                  ],),
                gapH8,
                Row(
                  children: [
                    Expanded(
                      child:SizedBox(
                        height: 100,
                        child: CustomTapAbleCard(
                            onTap: (){
                              context.pushNamed(AppRoute.helppage.name);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage(AppAsset.messageIcon),color: kLightBlueOpacity08,),
                                gapH8,
                                Text(Strings.help,style: theme.textTheme.caption!.copyWith(color: kLightBlueOpacity08),),
                              ],)),
                      ),
                    ),
                    gapW8,
                    Expanded(
                      child:SizedBox(
                        height: 100,
                        child: CustomTapAbleCard(
                            onTap: (){context.pushNamed(AppRoute.helppage.name);},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageIcon(AssetImage(AppAsset.chatIcon),color: kLightBlueOpacity08,),
                                gapH8,
                                Text(Strings.chatWithUs,style: theme.textTheme.caption!.copyWith(color: kLightBlueOpacity08),),
                              ],)
                        ),
                      ),
                    )
                  ],),
                gapH16,
              ],),
            ),
            HeaderWidget(theme: theme)
          ],),
      ),
    );
  }

  _sliderWidget(IntroSliderModel slider){
   return CustomCard(child: Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(slider.description)),
          gapW8,
          CustomImage(imageUrl: slider.image,width: 80,height: 80,fit: BoxFit.fitHeight,)
        ],),
    ));
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(color: kWhite,),
      gapH20,
      Text(Strings.teleco,style: theme.textTheme.headline5,),
      gapH20,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(Strings.telecoBreifIntro),
      ),
      gapH24,
      _NavigationUserAreaLegalWidget(theme: theme),
      gapH12,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.facebook,color: kLightBlueOpacity08,),
          gapW20,
          FaIcon(FontAwesomeIcons.twitter,color: kLightBlueOpacity08,),
          gapW20,
          FaIcon(FontAwesomeIcons.instagram,color: kLightBlueOpacity08,),
          gapW20,
          FaIcon(FontAwesomeIcons.snapchat,color: kLightBlueOpacity08,),

        ],),
      gapH20,
      Container(
        width: double.maxFinite,
        height: 50,
        color: kBlack,
        child: Center(
          child: Text(
            'Copyright©2022 teleco. All rights reserved',textAlign: TextAlign.center,
          ),
        ),
      )
    ],);
  }
}

class _NavigationUserAreaLegalWidget extends StatelessWidget {
  const _NavigationUserAreaLegalWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapW8,
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(Strings.navigation,style: theme.textTheme.headline6,),
          gapH12,
          Text(Strings.shop,style: theme.textTheme.caption,),
          gapH8,
          Text(Strings.paymentAndRecharge,style: theme.textTheme.caption,),
            gapH8,
            Text(Strings.aboutUs,style: theme.textTheme.caption),
            gapH8,
            Text(Strings.help,style: theme.textTheme.caption),
            gapH24,
            /// legal
            Text(Strings.legal,style: theme.textTheme.headline6,),
            gapH12,
            Text(Strings.disclaimer,style: theme.textTheme.caption,),
            gapH8,
            Text(Strings.termsAndCondition,style: theme.textTheme.caption,),
            gapH8,
            Text(Strings.customerRightsAndResponsibility,style: theme.textTheme.caption,),
            gapH8,
          ],),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.userArea,style: theme.textTheme.headline6,),
            gapH12,
            Text(Strings.login,style: theme.textTheme.caption,),
            gapH8,
            Text(Strings.register,style: theme.textTheme.caption,),
            gapH8

          ],),
          gapW8,
      ],),
    );
  }
}
