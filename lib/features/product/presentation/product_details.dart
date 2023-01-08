import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teleco/constants/app_size.dart';
import 'package:teleco/constants/common_data.dart';
import 'package:teleco/constants/string_values.dart';
import 'package:teleco/features/home/presentation/home_page.dart';
import 'package:teleco/shared_widgets/custom_carousel.dart';
import 'package:teleco/shared_widgets/custom_elevated_button.dart';
import 'package:teleco/shared_widgets/custom_image.dart';
import '../../../constants/colors_data.dart';
import '../../../shared_widgets/custom_card_view.dart';
import '../../../shared_widgets/custom_scaffold_widget.dart';

class ProductDetails extends StatelessWidget {
  final ProductTagModel product;
  const ProductDetails({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return CustomScaffoldWidget(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              CarouselCustomWidget(
                  aspectRatio: 1.9,
                  widgets: [
                CustomImage(imageUrl: product.image!,fit: BoxFit.fitWidth,width: double.maxFinite,),
                    CustomImage(imageUrl: product.image!,fit: BoxFit.fitWidth,width: double.maxFinite,),
                    CustomImage(imageUrl: product.image!,fit: BoxFit.fitWidth,width: double.maxFinite,),

              ]),
              gapH20,
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(product.name!,style:theme.textTheme.headline4)),
              gapH20,
              Text(product.des2!,),
              gapH32,
              QuantityWidgetProduct(theme: theme, value: product.price!),
              gapH48,
              CustomElevatedButton(
                  width: 350,
                  style: theme.elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(kLightBlueOpacity08)),
                  onPress: (){}, text: Strings.buyNow),
              gapH16,
              CustomTapAbleCard(
                  onTap: (){},
                  color: kNavyBlue,
                  borderColor: kLightBlueOpacity08,
                  width: 350,
                  height: 50,
                  child: Center(child: Text(Strings.addToCart,))),
              gapH32,

            ],),
          ),
          HeaderWidget(theme: theme),
        ],
      ),
    ),
    );
  }
}
class QuantityWidgetProduct extends ConsumerStatefulWidget {

  String value;

  QuantityWidgetProduct({
    Key? key,
    required this.theme,
    required this.value,
  }) : super(key: key);

  final ThemeData theme;

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}
class _QuantityWidgetState extends ConsumerState<QuantityWidgetProduct> {
  @override
  Widget build(BuildContext context) {
    final value=ref.watch(quantityProductProvider);
    return CustomCard(
      color: kNavyBlue,
      padding: 8,
      child: Row(
        children: [
        CustomTapAbleCard(
            color: kNavyBlue,
            borderColor: kLightBlueOpacity08,
            onTap: (){
              if(value>1)
              {
                ref.read(quantityProductProvider.state).state-=1;
              }
            },
            child:FaIcon(FontAwesomeIcons.minus)),
        CustomTapAbleCard(
            color: kNavyBlue,
            borderColor: kLightBlueOpacity08,
            padding: 8,
            width: 70,
            child: Center(child: Text(value.toString(),style: TextStyle(color: kWhite,fontWeight: FontWeight.bold),))),
        CustomTapAbleCard(
            onTap: (){
              ref.read(quantityProductProvider.state).state+=1;

            },
            color: kNavyBlue,
            borderColor: kLightBlueOpacity08,
            child: Icon(Icons.add)),
          Spacer(),
          Text(widget.value,style:widget.theme.textTheme.headline4!.copyWith(color: kLightBlueOpacity08),)
      ],),
    );
  }
}
final quantityProductProvider=StateProvider<int>((ref) => 1);
