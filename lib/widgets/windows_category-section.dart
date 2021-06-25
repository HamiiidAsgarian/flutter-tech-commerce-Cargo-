import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/category_screen.dart';
import 'package:flutter/material.dart';

class WindowsCategorySection extends StatelessWidget {
  const WindowsCategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cBackgroundGrey,
      padding: const EdgeInsets.symmetric(horizontal: 20),

      ///*    15px instead of 25px because the children padding adds 10px from the sides,
      child: Wrap(
        children: const [
          ScreenWidthSizedContainer(color: Colors.yellow),
          ScreenWidthSizedContainer(color: Colors.red),
          ScreenWidthSizedContainer(color: Colors.purple),
          ScreenWidthSizedContainer(color: Colors.blueGrey),
        ],
      ),
    );
  }
}

class ScreenWidthSizedContainer extends StatelessWidget {
  const ScreenWidthSizedContainer({this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: (MediaQuery.of(context).size.width / 2) -
          25, //////////* 25px for the 25px of section padding
      width: (MediaQuery.of(context).size.width / 2) - 25,
      // color: Colors.amber,               //////////////////////////// * item main frame
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: TextButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CategoryScreen();
          })),
          child: Stack(children: [
            Container(
              color: color,
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: Text("Fashion accessoars",
                  textAlign: TextAlign.center,
                  style: priceFontStyle.copyWith(
                      fontSize: 17, color: Colors.white)),
            )
          ]),
        ),
      ),
    );
  }
}
