import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teleco/constants/colors_data.dart';


class CustomDropDownButton extends ConsumerStatefulWidget {
   List items;
  String title;
  final Color? enableColor,textColor;
  CustomDropDownButton({Key? key, required this.items,  required this.title,this.enableColor, this.textColor,}) : super(key: key);

  @override
  CustomDropDownButtonState createState() => CustomDropDownButtonState();
}

class CustomDropDownButtonState extends ConsumerState<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      focusColor:Colors.white,
      //elevation: 5,
      style:  const TextStyle(color: Colors.white),
      iconEnabledColor:Colors.black,
      dropdownColor: kLightBlue,
      items:widget.items.map<DropdownMenuItem<dynamic>>((value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text(value,style: TextStyle(color:kWhite),),
        );
      }).toList(),
      isExpanded: true,
      hint:Text(widget.title,),
      onChanged: (value) {
          setState(() {
            widget.title = value!;
            ref.read(dropDownValueProvide.notifier).state=value;
          });
      },
    );
  }
}
final dropDownValueProvide=StateProvider((ref) => '');
