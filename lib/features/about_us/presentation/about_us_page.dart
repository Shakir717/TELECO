import 'package:flutter/material.dart';
import 'package:teleco/constants/app_assets.dart';
import 'package:teleco/constants/app_size.dart';
import 'package:teleco/features/home/presentation/home_page.dart';
import 'package:teleco/shared_widgets/appBar.dart';
import 'package:teleco/shared_widgets/custom_image.dart';
import 'package:teleco/shared_widgets/custom_scaffold_widget.dart';

import '../../../constants/string_values.dart';

class AboutUSPage extends StatelessWidget {
  const AboutUSPage({Key? key}) : super(key: key);

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
                gapH64,
                Container(
                  decoration: BoxDecoration(
                    image:DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(AppAsset.aboutBackgroundImage)),
                  ),
                  child: Column(children: [
                    Text(Strings.aboutUs,style: theme.textTheme.headline4,),
                    gapH20,
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(Strings.aboutUsPageParagraph),
                    )

                  ],),
                ),
                gapH64
              ],),
            ),
            HeaderWidget(theme: theme),
        ],),
      ),
    );
  }
}
