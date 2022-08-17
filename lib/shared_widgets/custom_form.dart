import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key, required this.child,required this.formKey}) : super(key: key);
  final Widget child;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Form(
        key:formKey,
        child:child,
      ),
    );
  }
}
