import 'package:flutter/material.dart';

class CustomCardButton extends StatelessWidget {
  CustomCardButton({
    super.key,
    required this.onPress,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback onPress;
  final String label;
  var designation, linemanager;
  final Icon icon;
  var backgroundColor;
  var foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: InkWell(
        onTap: onPress,
        child: Card(
          color: backgroundColor,
          elevation: 20,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              icon,
              Text(
                label,
                style: TextStyle(
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
