import 'package:commerce_app/consts.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

class ScrollviewCategory extends StatelessWidget {
  const ScrollviewCategory({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  final String? sectionTitle;

  @override
  Widget build(BuildContext context) {
    final List<String> mainScreenItems = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h'
    ];

    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 5),
      color: cBackgroundGrey,
      child: Column(children: [
        // SizedBox(height: 10),
        CategoryTitle(sectionTitle: sectionTitle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: mainScreenItems
                  .map((e) => Container(
                      // color: Colors.white,
                      padding:
                          const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                      child: Item(title: e)))
                  .toList()),
        ),
      ]),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  final String? sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle != null ? sectionTitle! : "",
          style: forMenFontStyle,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/ListedItems");
          },
          child: Row(
            children: const [
              Text(
                "View More ",
                style: viewMoreFontStyle,
              ),
              Icon(
                MyFlutterApp.right_open,
                size: 13,
                color: appBargrey,
              )
            ],
          ),
        )
      ],
    );
  }
}

// ////////////////////////////////////////////////////////////* items
