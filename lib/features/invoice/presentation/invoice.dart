
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/constants/app_assets.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/routing/app_router.dart';
import 'package:telfoni/shared_widgets/custom_elevated_button.dart';

import '../../../constants/string_values.dart';
import '../../../shared_widgets/custom_image.dart';

class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH20,
        Align(
            alignment: Alignment.topCenter,
            child: CustomImage( imageUrl:AppAsset.appLogoBlack,width: 120,height: 50,fit: BoxFit.fitWidth,)),
        gapH20,
        Text(Strings.invoice,style:theme.textTheme.headline6!.copyWith(color: kBlack),),
        gapH20,
        ///invoice number description
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Strings.invoiceNumber,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
              gapH8,
              Text('004',style: theme.textTheme.caption!.copyWith(color: kBlack,fontWeight: FontWeight.w600),),
              gapH20,
              Text(Strings.date,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
              gapH8,
              Text('August 12, 2022',style: theme.textTheme.caption!.copyWith(color: kBlack,fontWeight: FontWeight.w600),),
            ],
          ),
          gapW24,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Strings.description,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
              gapH8,
              Text(Strings.telfoniBundles,style: theme.textTheme.caption!.copyWith(color: kBlack,fontWeight: FontWeight.w600),),
            ],
          ),
        ],),
        gapH48,
        ///details
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.number,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            gapW32,
            Text(Strings.bundle,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            Spacer(),
            Text(Strings.price,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),)
        ],),
        gapH8,
        Divider(color: kBlack,),
        gapH8,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('12345',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            Spacer(),
            Text('3Days|100 MB|No Sharing',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            Spacer(),
            Text('€1.00',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12,fontWeight: FontWeight.w700),)
          ],),


        gapH8,
        Divider(color: kBlack,),
        gapH8,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('123',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            Spacer(),
            Text('3Days|100 MB|Unlimited',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
            Spacer(),
            Text('€5.00',style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12,fontWeight: FontWeight.w700),)
          ],),

        gapH8,
        Divider(color: kBlack,),
        gapH8,
        /// total
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(Strings.total,style: theme.textTheme.caption!.copyWith(color: kBlack,fontWeight: FontWeight.w600),),
            gapW32,
            Text('€20.95',style: theme.textTheme.headline6!.copyWith(color: kBlack,fontSize: 16),),
        ],
        ),
        gapH32,
        CustomElevatedButton(
          width: double.maxFinite,
          onPress: (){
            Navigator.of(context).pop();
            context.pushNamed(AppRoute.bundles.name);
          }, text: Strings.proceedToPayment,)
      ],
    );
  }
}
