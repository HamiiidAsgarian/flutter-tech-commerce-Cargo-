import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class BlackRoundedButton extends StatelessWidget {
  const BlackRoundedButton({
    this.title,
    required this.function,
  });

  final String? title;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: 40,
        child: TextButton(
          onPressed: () => function(),
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
