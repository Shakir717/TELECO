import 'package:flutter/material.dart';
import 'package:telfoni/constants/app_size.dart';
import 'package:telfoni/constants/colors_data.dart';
import 'package:telfoni/features/home/presentation/home_page.dart';
import 'package:telfoni/shared_widgets/custom_card_view.dart';
import 'package:telfoni/shared_widgets/custom_scaffold_widget.dart';
import '../../../constants/string_values.dart';
import '../../../shared_widgets/custom_image.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

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
              CustomCard(child:
              Column(children: [
                gapH20,
                Text(Strings.contactNumbers,style: theme.textTheme.headline5,),
                gapH8,
                Divider(color: kLightBlueOpacity08,endIndent: 50,indent: 50,thickness: .5,),
                gapH8,
                Text('+44 20 3608 2770',style: theme.textTheme.headline5,),
                gapH4,
                Text(Strings.ukOrInternational,style: theme.textTheme.caption,),

                gapH16,
                Divider(color: kLightBlueOpacity08,endIndent: 50,indent: 50,thickness: .5,),
                gapH16,
                Text('222 66 995',style: theme.textTheme.headline5,),
                gapH4,
                Text(Strings.kuwait,style: theme.textTheme.caption,),
                gapH16,
                Text('972 70 313',style: theme.textTheme.headline5,),
                gapH4,
                Text(Strings.hotline,style: theme.textTheme.caption,),
                gapH16,
                Divider(color: kLightBlueOpacity08,endIndent: 50,indent: 50,thickness: .5,),
                gapH8,
                Text(Strings.whatsapp,style: theme.textTheme.headline5,),
                gapH4,
                Text('+44 7848 3102 80',style: theme.textTheme.caption,),
                gapH4,
                Text('+965 972 70 313',style: theme.textTheme.caption,),
                gapH20,
              ],)),
              gapH16,
              CustomImage(imageUrl: 'assets/demo.png',
                width: double.maxFinite,
                height: 230,
                fit: BoxFit.contain,),
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
