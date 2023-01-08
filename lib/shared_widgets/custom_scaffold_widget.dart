
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/routing/app_router.dart';

import '../constants/app_assets.dart';
import '../constants/colors_data.dart';
import '../constants/string_values.dart';
import '../features/authentications/sign_in/presentation/sign_in_page.dart';
import 'alert_dialogs.dart';
import 'custom_drawar.dart';
import 'custom_image.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final Widget body;
  CustomScaffoldWidget({Key? key,required this.body}) : super(key: key);
  final _key=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      key: _key,
      appBar:AppBar(

        actions: [
          IconButton(onPressed:(){
            widgetClassDialog(context: context,
                title: '', content: SignInPage()
            );
            // context.pushNamed(AppRoute.signin.name);
          }, icon:  ImageIcon(AssetImage(AppAsset.userIcon)),),

          IconButton(onPressed: (){
            _key.currentState!.openEndDrawer();
          },icon: ImageIcon(AssetImage(AppAsset.menuIcon)),),
        ],
        //title: Text(LocaleKeys.appTitle.tr()),
       titleSpacing: 14,
        title: Text(Strings.teleco),
      ),
      body:body,
    );
  }
}
