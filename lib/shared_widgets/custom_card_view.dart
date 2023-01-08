import 'package:flutter/material.dart';
import 'package:teleco/constants/colors_data.dart';
import 'package:teleco/extensions/color_extension.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.child, this.color, this.margin, this.padding=4,this.borderRadius, this.width, this.height, this.borderColor}) : super(key: key);
  final Widget child;
  final Color? color,borderColor;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? width,height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        margin: margin,
        color:color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kLightBlueOpacity02,
          ),
            borderRadius: BorderRadius.circular(borderRadius??8),

        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,),
      ),
    );
  }
}

class CustomTapAbleCard extends StatelessWidget {
  const CustomTapAbleCard({Key? key, required this.child, this.color, this.margin, this.onTap, this.padding=4,  this.borderRadius=1, this.width, this.height, this.borderColor}) : super(key: key);
  final Widget child;
  final Color? color,
      borderColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double padding;
  final double borderRadius;
  final double? width,height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          margin: margin,
          color:color,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color:borderColor?? kLightBlueOpacity02,
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(padding: EdgeInsets.all(padding),
          child: child,),
        ),
      ),
    );
  }
}