import 'package:flutter/material.dart';

import '../consts.dart';

////////////////////////////////////////////////////////////////////
class Carousel extends StatefulWidget {
  const Carousel({Key? key, required this.sliderIndex, required this.itemIndex})
      : super(key: key);

  final int sliderIndex;
  final int itemIndex;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // late PageController controller;
  int currentpage = 1;
  var controller = PageController(
    initialPage: 1,
    keepPage: false,
    viewportFraction: 0.75, ////*fraction
  );

  List carouselItems = [
    {"hasLabel": true, "labelText": "New 1"},
    {"hasLabel": false},
    {"hasLabel": true, "labelText": "New 3"}
  ];

  List<Widget> slideBuilder(List list, PageController controller) {
    List<Widget>? slideWidgets = [];
    list.asMap().forEach((index, element) {
      slideWidgets.add(Slide(
        controller: controller,
        index: index,
        hasLabel: element["hasLabel"],
        label: element["labelText"],
      ));
    });
    print(slideWidgets);
    return slideWidgets;
  }

  List<Widget> counterDotsBuilder(List list, int selectedIndex) {
    List<Widget>? counterDotsWidgets = [];
    list.asMap().forEach((index, element) {
      counterDotsWidgets.add(Padding(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: selectedIndex == index
              ? greySelectedCircule
              : greyUnselectedCircule, ////////////////////* circules color
        ),
      ));
    });
    print(counterDotsWidgets);
    return counterDotsWidgets;
  }

  @override
  initState() {
    // if (controller.hasClients) {
    //   print("yes");
    //   // controller.jumpToPage(1);
    // }

    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        //////////////////////////////////////////* whole slider bar
        height: 200,
        color: Colors.white,
        child: Column(children: [
          Expanded(
            child: PageView
                // .builder
                (
              onPageChanged: (value) {
                print(value);
                setState(() {
                  currentpage = value;
                });
              },
              controller: controller,
              children: slideBuilder(carouselItems, controller),
              // itemBuilder: (context, index) => builder(index)),
            ),
          ),
          Container(
            width: 80,
            height: 25,
            // color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: counterDotsBuilder(carouselItems, currentpage),
            ),
          )
        ]),
      ),
    ));
  }

  // slideBuilder(int index, bool hasLabel, String labelText) {}
}

////////////////////////////////////////////////////////////////////////*slide class
class Slide extends StatefulWidget {
  Slide(
      {required this.controller,
      required this.index,
      required this.hasLabel,
      this.label});

  final PageController controller;
  final int index;
  final bool hasLabel;
  final String? label;
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        double value = 1.0;
        if (widget.controller.position.haveDimensions) {
          // print(controller.position.viewportDimension);
          value = widget.controller.page! - widget.index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        } else {
          value = widget.controller.initialPage.toDouble() - widget.index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: Container(
            ////////////////////////////////////////////////* slide's main frame
            // color: Colors.amber,
            height: Curves.easeOut.transform(value) * 200,
            width: 400,
            child: Stack(
              children: [
                //////////////////////////////////////////////////////// * counter dots

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    ////////////////////////////////////* main slide
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: widget.index % 2 == 0
                          ? Colors.blue
                          : Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    // margin: const EdgeInsets.all(8.0),
                  ),
                ),
                //////////////////////////////////////////////////////// * label
                widget.hasLabel == true
                    ? Align(
                        alignment: Alignment(-0.7, 0.6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Colors.white,
                            width: 80,
                            height: 25,
                            child: Center(
                              child: Text(
                                widget
                                    .label!, ////////////////////////* label text
                                style: standardSearchFontStyle,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        );
      },
      // child:
    );
  }
}
