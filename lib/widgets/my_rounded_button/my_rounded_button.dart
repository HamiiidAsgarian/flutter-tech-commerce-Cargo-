import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.orangeAccent[700],
        height: 45,
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text("Log In",
                style: itemTitleFontStyle.copyWith(
                    fontSize: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
