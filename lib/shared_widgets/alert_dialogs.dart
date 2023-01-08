import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/app_assets.dart';
import '../constants/colors_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const kDialogDefaultKey = Key('dialog-default-key');

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  VoidCallback? yes,
  VoidCallback? no,
}) async {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(
        title: Text(title,style: Theme.of(context).textTheme.headline4,),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  minimumSize:MaterialStateProperty.resolveWith((states) => const Size(100,40))
              ),
              child: Text(cancelActionText,style: Theme.of(context).textTheme.headline6!.copyWith(color: kRed),),
              onPressed: () => no?? Navigator.of(context).pop(false),
            ),
          TextButton(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
              minimumSize:MaterialStateProperty.resolveWith((states) => const Size(100,40))
            ),
            key: kDialogDefaultKey,
            child: Text(defaultActionText),
            onPressed: () => yes?? Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title,style: Theme.of(context).textTheme.headline4,),
      content: content != null ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText,),
            onPressed: () => no?? Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          key: kDialogDefaultKey,
          child: Text(defaultActionText),
          onPressed: () => yes?? Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: exception.toString(),
      defaultActionText: 'OK',
    );

Future<void> showNotImplementedAlertDialog({required BuildContext context}) =>
    showAlertDialog(
      context: context,
      title: 'Not implemented',
    );

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> openDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  VoidCallback? yes,
  VoidCallback? no,
}) async {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,

      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(

        //title: Row(children: [Text(title,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),const Spacer(),IconButton(color: kGrey,onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.cancel,size: Sizes.p24,color: kGrey,))],),
        content: content,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  minimumSize:MaterialStateProperty.resolveWith((states) => const Size(100,40))
              ),
              child: Text(cancelActionText,style: Theme.of(context).textTheme.headline6!.copyWith(color: kRed),),
              onPressed: (){
                if(no==null){
                  Navigator.of(context).pop(true);
                }else{
                  no.call();
                }
              },
            ),
          if (defaultActionText.isNotEmpty)
          TextButton(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                minimumSize:MaterialStateProperty.resolveWith((states) => const Size(100,40))
            ),
            key: kDialogDefaultKey,
            child: Text(defaultActionText),
            onPressed:(){
              if(yes==null){
                Navigator.of(context).pop(true);
              }else{
                yes.call();
              }
            },
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(
      //title: Row(children: [Text(title,style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),const Spacer(),IconButton(color: kGrey,onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.cancel,size: Sizes.p24,color: kGrey,))],),
      content: content,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText,),
              onPressed: (){
                if(no==null){
                  Navigator.of(context).pop(true);
                }else{
                  no.call();
                }
              },
          ),
        CupertinoDialogAction(
          key: kDialogDefaultKey,
          child: Text(defaultActionText),
            onPressed: (){
              if(yes==null){
                Navigator.of(context).pop(true);
              }else{
                yes.call();
              }
            },
        ),
      ],
    ),
  );
}
/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> widgetClassDialog({
  required BuildContext context,
  required String title,
  required Widget content,
  String? cancelActionText,
  String? defaultActionText,
  VoidCallback? yes,
  VoidCallback? no,
}) async {

  return showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) => AlertDialog(
      scrollable:true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      contentPadding: EdgeInsets.only(left:20,right: 20,bottom: 20),
      content: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
        content,
        Positioned(
          child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
            },
          child: CircleAvatar(radius: 60,
            backgroundColor: Colors.transparent,
            child:Image.asset(AppAsset.closeCircle),
          ),
        ), top: -60,)
      ],),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText,),
            onPressed: (){
              if(no==null){
                Navigator.of(context).pop(true);
              }else{
                no.call();
              }
            },
          ),

        if(defaultActionText != null)
          CupertinoDialogAction(
            key: kDialogDefaultKey,
            child: Text(defaultActionText),
            onPressed: (){
              if(yes==null){
                Navigator.of(context).pop(true);
              }else{
                yes.call();
              }
            },
          ),
      ],
    ),
  );
}
