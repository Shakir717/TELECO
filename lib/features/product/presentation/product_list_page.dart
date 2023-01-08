import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/string_values.dart';
import 'package:teleco/routing/app_router.dart';
import 'package:teleco/shared_widgets/appBar.dart';

import '../../../constants/app_size.dart';
import '../../../constants/colors_data.dart';
import '../../../constants/common_data.dart';
import '../../../shared_widgets/custom_card_view.dart';
import '../../../shared_widgets/custom_elevated_button.dart';
import '../../../shared_widgets/custom_image.dart';
import '../../../shared_widgets/custom_scaffold_widget.dart';
import '../../home/presentation/home_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return CustomScaffoldWidget(
     body: SingleChildScrollView(
       child: Column(children: [
         ListView.builder(
             itemCount: productList.length,
             shrinkWrap: true,
             padding: EdgeInsets.all(8),
             physics: NeverScrollableScrollPhysics(),

             itemBuilder:(_,i){
               ProductTagModel product=productList[i];
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CustomTapAbleCard(
                     onTap: (){
                       context.pushNamed(AppRoute.productdetails.name,extra: product);
                     },
                     padding: 8,
                     child: Column(children: [
                       CustomImage(imageUrl: product.image!,width: double.maxFinite,fit: BoxFit.fitWidth,),
                       gapH16,
                       Align(
                           alignment: Alignment.bottomLeft,
                           child: Text(product.name!,style: theme.textTheme.headline5,)),
                       gapH16,
                       Text(product.des!),
                       gapH20,
                       Row(children: [
                         Text(product.price!,style: theme.textTheme.headline5,),
                         Spacer(),
                         CustomElevatedButton(
                             width: 130,
                             height: 30,
                             style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(kLightBlueOpacity08)),
                             onPress: (){                  context.pushNamed(AppRoute.productdetails.name,extra: product);
                             }, text:Strings.buyNow)
                       ],)

                     ],)),
               );
             }),
         gapH32,
         HeaderWidget(theme: theme),
       ],),
     ),
    );
  }
}
