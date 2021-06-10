import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class BlackRoundedButton extends StatelessWidget {
  const BlackRoundedButton({
    Key? key,
  }) : super(key: key);

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
            'Add to cart',
            style: priceFontStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
