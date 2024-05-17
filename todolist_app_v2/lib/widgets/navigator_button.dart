import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String title;
  final String page;
  final Color colorTextStyle;
  final Color backgroundColorButton;

  const NavigatorButton({
    super.key,
    required this.title,
    required this.page,
    required this.colorTextStyle,
    required this.backgroundColorButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(page);
        },
        style: TextButton.styleFrom(
          backgroundColor: backgroundColorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Text(
          title,
          style: TextStyle(color: colorTextStyle),
        ),
      ),
    );
  }
}
