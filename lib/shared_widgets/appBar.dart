
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors_data.dart';

AppBar simpleArrowBackAppBarWithTitle({required BuildContext context, required ThemeData theme,required String title,List<Widget>? actions}) {
  return AppBar(
    leading:IconButton(
      onPressed: (){context.pop();},
      icon: const Icon(Icons.arrow_back),
    ),
    iconTheme: IconThemeData(color: kWhite),
    backgroundColor:kNavyBlue,
    elevation: 0,
    actions: actions,
    title: Text(title,style: theme.textTheme.headline4!.copyWith(color:kWhite),),
    centerTitle: actions==null?true:false,);
}