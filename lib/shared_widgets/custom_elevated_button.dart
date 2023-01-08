import 'package:flutter/material.dart';
import 'package:teleco/constants/colors_data.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final ButtonStyle? buttonStyle;
  final bool loading;
  final double? width, height;
  final ButtonStyle? style;

  const CustomElevatedButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.buttonStyle,
      this.loading = false,
      this.style, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: style,
        onPressed: onPress,
        child: loading
            ?  Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(color: kWhite,),
              )
            : Text(
                text,
                style: theme.textTheme.button,
              ),
      ),
    );
  }
}
