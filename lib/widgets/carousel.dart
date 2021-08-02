import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({
    Key? key,
    required this.items,
    //  this.sliderIndex = 1, this.itemIndex = 1
  }) : super(key: key);

  // final int sliderIndex;
  // final int itemIndex;
  final List<dynamic> items;

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  // late PageController controller;
  int currentpage = 1;
  PageController controller =
      PageController(initialPage: 1, keepPage: false, viewportFraction: 0.85);

  //NOTE carousel builder function
  List<Widget> slideBuilder(List list, PageController controller)
  //? referenceData is the data gotten to route into  Product page
  {
    final List<Widget> carouselsList = [];
    list.asMap().forEach((index, element) {
      // print(referenceData[element["ctegory"]]);
      carouselsList.add(Slide(
        controller: controller,
        index: index,
        // hasLabel: element["hasLabel"],
        label: element["label"], //if null, no label is created
        imageUrl: element["imageURL"],
        // data: referenceData[element["ctegory"]],
        title: element["ctegory"],
      ));
    });
    return carouselsList;
  }

  //NOTE status dots builder function
  List<Widget> counterDotsBuilder(List list, int selectedIndex) {
    final List<Widget> counterDotsWidgets = [];
    list.asMap().forEach((index, element) {
      counterDotsWidgets.add(Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 6,
          child: CircleAvatar(
              radius: 5,
              backgroundColor: selectedIndex == index
                  ? Colors.black.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5)),
        ),
      ));
    });
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
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 700), //REVIEW
        child: AspectRatio(
          //REVIEW main frame aspect ratio
          aspectRatio: 1.5 / 1,
          child: Container(
              // height: 200,
              // color: Colors.pink,
              child: Column(children: [
            // FutureBuilder(
            //     future: vals.getDataFromApi(
            //         url:
            //             'http://localhost:3000/scrollableItems'), //NOTE internal data recieve for generating selected items products page
            //     builder:
            //         (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
            //       if (snapshot.hasData) {
            //         return Expanded(
            //           child: PageView(
            //               onPageChanged: (value) {
            //                 setState(() {
            //                   currentpage = value;
            //                 });
            //               },
            //               controller: controller,
            //               children: slideBuilder(
            //                   widget.items, controller, snapshot.data!)),
            //         );
            //       }
            //       return CircularProgressIndicator();
            //     }),
            Expanded(
              child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentpage = value;
                    });
                  },
                  controller: controller,
                  children: slideBuilder(widget.items, controller)),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: counterDotsBuilder(widget.items, currentpage))
          ])),
        ),
      );
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
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double _value = 1.0;
          if (widget.controller.position.haveDimensions) {
            // print(controller.position.viewportDimension);
            _value = widget.controller.page! - widget.index;
            _value = (1 - (_value.abs() * .5)).clamp(0.0, 1.0);
          } else {
            _value = widget.controller.initialPage.toDouble() - widget.index;
            _value = (1 - (_value.abs() * .5)).clamp(0.0, 1.0);
          }
          // print(context.size);
          return Center(
            child: GestureDetector(
              onTap: () async {
                var categoryData = await vals.getDataFromApiToList(
                    url: 'http://localhost:3000/${widget.title}');

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListedItemsScreen(
                      title: widget.title, itemsList: categoryData);
                }));
              },

              // onTap: () {
              //   //NOTE sending to new items page
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ListedItemsScreen(
              //               title: widget.title, itemsList: widget.data)));
              // },
              ////////////////////////////////////////////////* slide's main frame
              child: Stack(
                children: [
                  Padding(
                    //NOTE gap between pages
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: Align(
                      //NOTE slides animating aspect ratio
                      child: AspectRatio(
                        aspectRatio: 1.7 / Curves.easeOut.transform(_value),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(widget.imageUrl ?? "",
                                fit: BoxFit.cover)),
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
          );
        },
        // child:
      );
    });
  }
}
