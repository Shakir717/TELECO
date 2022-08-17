import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/constants/string_values.dart';
import 'package:telfoni/features/home/presentation/home_page.dart';
import 'package:telfoni/routing/app_router.dart';
import 'package:telfoni/shared_widgets/appBar.dart';
import 'package:telfoni/shared_widgets/custom_card_view.dart';
import 'package:telfoni/shared_widgets/custom_elevated_button.dart';
import '../../../constants/common_data.dart';
import '../../../shared_widgets/custom_image.dart';
import '../../../shared_widgets/custom_scaffold_widget.dart';

class BundlesPage extends StatefulWidget {
  const BundlesPage({Key? key}) : super(key: key);

  @override
  State<BundlesPage> createState() => _BundlesPageState();
}

class _BundlesPageState extends State<BundlesPage> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return CustomScaffoldWidget(
    body: SingleChildScrollView(child:
    Column(
      children: [
        gapH20,
      Align(
          alignment: Alignment.center,
          child: Text(Strings.bundles,style: theme.textTheme.headline4,)),

        gapH16,
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: .6,
            mainAxisSpacing:14,crossAxisSpacing: 14

          ),
          padding: EdgeInsets.all(10),
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
                  SizedBox(
                      height:35,
                      width: 150,
                      child: ElevatedButton(
                        style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(kNavyBlue.withOpacity(.2))),
                        onPressed: () {  }, child: Text(Strings.buyNow,style: theme.textTheme.headline6,),)),
                ],),
            );
          }).toList(),

        ),
        gapH24,
        Align(
            alignment: Alignment.center,
            child: Text(Strings.products,style: theme.textTheme.headline4,)),
        gapH32,
        ListView.builder(
            itemCount: productList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(_,i){
              ProductTagModel product=productList[i];
              return CustomTapAbleCard(
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

              ],));
            }),
        gapH32,
        HeaderWidget(theme: theme),
      ],
    ),
    ),
    );
  }
}
