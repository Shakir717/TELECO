import 'package:flutter/material.dart';
import 'package:teleco/constants/colors_data.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.validator, required this.controller, required this.text, this.inputDecoration,  this.editingComplete=false,this.readOnly=false, this.onTap, this.maxLine=1, this.inputType, this.suffixIcon, this.prefixIcon, this.textColor, this.labelColor}) : super(key: key);
 final String? Function(String?)? validator;
 final TextEditingController controller;
 final String text;
 final InputDecoration? inputDecoration;
 final bool editingComplete,readOnly;
 final Function()? onTap;
 final int maxLine;
 final TextInputType? inputType;
 final Icon? suffixIcon,prefixIcon;
 final Color? textColor,labelColor;
  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return TextFormField(
      style: TextStyle(color:textColor?? kBlack),
      keyboardType:inputType,
      maxLines: maxLine,
      readOnly:readOnly,
      onTap: onTap,
      validator:validator,
      controller: controller,
      textInputAction:(editingComplete) ? TextInputAction.done:TextInputAction.next,
      onEditingComplete:()=> (editingComplete) ? focus.unfocus():focus.nextFocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:inputDecoration?? InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: kLightBlueOpacity08,
        prefixIcon: prefixIcon,
        prefixIconColor: kLightBlueOpacity08,
        floatingLabelStyle: TextStyle(color: labelColor?.withOpacity(.5)),
        labelStyle: TextStyle(color: labelColor,),
        labelText: text,),
    );
  }
}

class CustomTextFieldWithoutBorder extends StatelessWidget {
  const CustomTextFieldWithoutBorder({Key? key, this.validator, required this.controller, required this.text, this.inputDecoration,  this.editingComplete=false,this.readOnly=false, this.onTap, this.maxLine=1, this.inputType, this.suffixIcon, this.prefixIcon, this.textColor, this.labelColor}) : super(key: key);
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String text;
  final InputDecoration? inputDecoration;
  final bool editingComplete,readOnly;
  final Function()? onTap;
  final int maxLine;
  final TextInputType? inputType;
  final Icon? suffixIcon,prefixIcon;
  final Color? textColor,labelColor;
  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return TextFormField(
      style: TextStyle(color:textColor,fontWeight: FontWeight.w600,fontSize: 14),
      keyboardType:inputType,
      maxLines: maxLine,
      readOnly:readOnly,
      onTap: onTap,
      validator:validator,
      controller: controller,
      textInputAction:(editingComplete) ? TextInputAction.done:TextInputAction.next,
      onEditingComplete:()=> (editingComplete) ? focus.unfocus():focus.nextFocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:inputDecoration?? InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: suffixIcon,
        suffixIconColor: kLightBlueOpacity08,
        prefixIcon: prefixIcon,
        prefixIconColor: kLightBlueOpacity08,
        floatingLabelStyle: TextStyle(color: labelColor!.withOpacity(.5)),
        labelStyle: TextStyle(color: labelColor,),

        labelText: text,),
    );
  }
}