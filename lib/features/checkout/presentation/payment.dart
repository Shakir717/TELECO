import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/constants/app_assets.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/constants/string_values.dart';
import 'package:telfoni/extensions/color_extension.dart';
import 'package:telfoni/shared_widgets/custom_card_view.dart';
import 'package:telfoni/shared_widgets/custom_elevated_button.dart';
import 'package:telfoni/shared_widgets/custom_image.dart';

import '../../../routing/app_router.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {

  int payment=0;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.maxFinite,),

        gapH32,
        Text(Strings.payment,style: theme.textTheme.headline5!.copyWith(color: kBlack),),
        gapH8,
        Text(Strings.selectPaymentMethod,style: theme.textTheme.caption!.copyWith(color: kBlack,fontSize: 12),),
        gapH32,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          CustomTapAbleCard(
            onTap: (){
              setState((){
                payment=1;
              });
              print(payment);
            },
            width: 145,
            height: 160,
              borderColor: payment==1?null:HexColor.fromHex('#A4A4A4'),
              color:payment==1 ? Colors.blue.shade50:kWhite,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              if(payment==1)
                Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(alignment: Alignment.topRight,child: Icon(Icons.check_circle,color: kLightBlue,)),
              ),
              gapH16,
              CustomImage(imageUrl: AppAsset.card,
                width: 80,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
              gapH16,
              Text(Strings.onlinePayment,style: theme.textTheme.caption!.copyWith(fontSize: 12,color: HexColor.fromHex('#5C5C5C'),fontWeight: FontWeight.w500),)

          ],)),
          gapW4,
          CustomTapAbleCard(
              onTap: (){
                setState((){
                  payment=2;
                });
                print(payment);
              },
              width: 145,
              height: 160,
              borderColor: payment==2?null:HexColor.fromHex('#A4A4A4'),
              color:payment==2? Colors.blue.shade50:kWhite,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(payment==2)
                    Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(alignment: Alignment.topRight,child: Icon(Icons.check_circle,color: kLightBlue,)),
                  ),

                  gapH16,
                  CustomImage(imageUrl: AppAsset.cash,
                    width: 80,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  gapH16,
                  Text(Strings.cashOnDelivry,style: theme.textTheme.caption!.copyWith(fontSize: 12,color: HexColor.fromHex('#5C5C5C'),fontWeight: FontWeight.w500),)

                ],))
        ],),
        gapH32,
        CustomElevatedButton(
            width: double.maxFinite,
            onPress:(){
          Navigator.of(context).pop();
          context.pushNamed(AppRoute.bundles.name);
        }, text: Strings.checkout),
      ],
    );
  }
}
