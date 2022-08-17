import 'package:flutter/material.dart';

import '../constants/app_size.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({Key? key, required this.child, required this.items}) : super(key: key);
  final Widget child;
  final List<PopupMenuItemModel> items;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: child,
      onSelected: (String value) => items.firstWhere((element) => element.value.contains(value)).onTap.call(),
      itemBuilder: (context) => items.map((e) => PopupMenuItem(value: e.value,child: e.widget)).toList());

  }
}
class PopupMenuItemModel{
  VoidCallback onTap;
  String value;
  Widget widget;
  PopupMenuItemModel({required this.value, required this.widget,required this.onTap});
}
