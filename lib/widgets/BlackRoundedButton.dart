import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class BlackRoundedButton extends StatelessWidget {
  final String? title;
  BlackRoundedButton({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: 40,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              // backgroundColor: Colors.pink,
              ),
          child: Text(
            title!,
            style: priceFontStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
