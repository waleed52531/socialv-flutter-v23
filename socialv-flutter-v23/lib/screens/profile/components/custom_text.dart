import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/utils/colors.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.label,
    this.fontweight,
    this.fontSize,
    this.softwrap,
    this.maxLines,
    this.overflow,

  }) : super(key: key);

  final String label;
  var fontweight;
  var softwrap;
  var maxLines;
  var overflow;
  var fontSize;


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 100, // Limit the height of the widget
      ),
      child: Text(
        textAlign: TextAlign.right,
        label,
        softWrap: softwrap,
        maxLines: maxLines,
        overflow: overflow,
        style: boldTextStyle(color: appColorPrimary,),

      ),
    );
  }
}

