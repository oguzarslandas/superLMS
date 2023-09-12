
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:lms_education/theme/box_icons_icons.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 20,
          width: 6,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xFF343434)),
        ),
        Text(
          text,
          style: TextStyle().copyWith(
            fontSize: 17.0,
          ),
        ),
        Spacer(),
    /*    CupertinoButton(
          child:
              Icon(BoxIcons.bx_chevron_right, color: material.Colors.lightBlue),
          onPressed: onPressed as void Function()?,
        )*/
      ],
    );
  }
}
