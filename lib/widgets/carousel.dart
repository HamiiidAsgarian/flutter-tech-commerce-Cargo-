import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection(
      {Key? key, required this.items, this.sliderIndex = 1, this.itemIndex = 1})
      : super(key: key);

  final int sliderIndex;
  final int itemIndex;
  final List<dynamic> items;

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // late PageController controller;
  int currentpage = 1;
  PageController controller = PageController(
    initialPage: 1,
    keepPage: false,
    viewportFraction: 0.75, ////*fraction
  );

  List<Widget> slideBuilder(
      List list, PageController controller, Map referenceData) {
    //NOTE slide builder
    final List<Widget> slideWidgets = [];
    list.asMap().forEach((index, element) {
      print(referenceData[index]);
      slideWidgets.add(Slide(
        controller: controller,
        index: index,
        // hasLabel: element["hasLabel"],
        label: element["label"],
        imageUrl: element["imageURL"],
        data: referenceData[element["ctegory"]],
        title: element["ctegory"],
      ));
    });
    // print(slideWidgets);
    return slideWidgets;
  }

  List<Widget> counterDotsBuilder(List list, int selectedIndex) {
    final List<Widget> counterDotsWidgets = [];
    list.asMap().forEach((index, element) {
      counterDotsWidgets.add(Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: selectedIndex == index
              ? greySelectedCircule
              : greyUnselectedCircule, ////////////////////* circules color
        ),
      ));
    });
    // print(counterDotsWidgets);
    return counterDotsWidgets;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Container(
          height: 200,
          //////////////////////////////////////////* whole slider bar
          // color: cBackgroundGrey,
          child: Column(children: [
            FutureBuilder(
                future: vals.getDataFromApi(
                    url: 'http://localhost:3000/scrollableItems'),
                builder:
                    (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return Expanded(
                      child: PageView
                          // .builder
                          (
                        onPageChanged: (value) {
                          // print(value);
                          setState(() {
                            currentpage = value;
                          });
                        },
                        controller: controller,
                        children: slideBuilder(widget.items, controller,
                            snapshot.data!), //NOTE pages future building
                        // itemBuilder: (context, index) => builder(index)),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
            Container(
                // width: 80,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: counterDotsBuilder(widget.items, currentpage),
                )),
          ]));
    });
  }
}

////////////////////////////////////////////////////////////////////////*slide class
class Slide extends StatefulWidget {
  const Slide(
      {required this.controller,
      required this.index,
      // required this.hasLabel,
      this.label,
      this.imageUrl,
      this.data,
      this.title});

  final PageController controller;
  final int index;
  // final bool hasLabel;
  final String? label;
  final String? imageUrl;

  final List? data;
  final String? title;
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
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListedItemsScreen(
                          title: widget.title,
                          itemsList:
                              widget.data))); //NOTE sending to new items page
            },
            child: Container(
              ////////////////////////////////////////////////* slide's main frame
              // color: Colors.amber,
              height: Curves.easeOut.transform(value) * 200,
              width: 400,
              child: Stack(
                children: [
                  Align(
                    child: Container(
                      height: Curves.easeOut.transform(value) * 200,
                      width: 400,

                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(widget.imageUrl ?? "",
                              fit: BoxFit.fill)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      ////////////////////////////////////* main slide
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        // color: widget.index % 2 == 0
                        //     ? Colors.blue
                        //     : Colors.redAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7, // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  //////////////////////////////////////////////////////// * label
                  if ((widget.label != "") && (widget.label != null))
                    Align(
                      alignment: const Alignment(-0.7, 0.6),
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
                  else
                    const SizedBox()
                ],
              ),
            ),
          ),
        );
      },
      // child:
    );
  }
}
