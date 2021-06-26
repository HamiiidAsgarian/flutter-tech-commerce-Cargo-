import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/02_category_screen.dart';
import 'package:flutter/material.dart';

class WindowsCategorySection extends StatelessWidget {
  const WindowsCategorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cBackgroundGrey,
      padding: const EdgeInsets.symmetric(horizontal: 10),

      ///*    15px instead of 25px because the children padding adds 10px from the sides,
      child: Wrap(
        runSpacing: 0,
        spacing: 0,
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
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: (MediaQuery.of(context).size.width / 2) -
            15, //////////* 25px for the 25px of section padding
        width: (MediaQuery.of(context).size.width / 2) - 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: RawMaterialButton(
            splashColor: cBackgroundGrey.withOpacity(0.5),
            fillColor: color,
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CategoryScreen();
            })),
            child: Stack(children: [
              Align(
                alignment: const Alignment(0, -0.7),
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Fashion ",
                        textAlign: TextAlign.center,
                        style: priceFontStyle.copyWith(
                            fontSize: 17, color: Colors.white)),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
