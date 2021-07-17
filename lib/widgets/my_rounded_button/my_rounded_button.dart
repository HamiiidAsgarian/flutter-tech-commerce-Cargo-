import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  MyRoundedButton({this.function, this.title});

  final Function? function;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.orangeAccent[700],
        height: 45,
        child: TextButton(
          onPressed: () => function!(),
          child: Center(
            child: Text(title ?? "NA",
                style: itemTitleFontStyle.copyWith(
                    fontSize: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
