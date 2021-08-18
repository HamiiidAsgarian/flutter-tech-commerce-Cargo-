import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.data});

  final Map? data;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<Map<String, dynamic>> _firstPageData;
  ScrollController _scrollController = new ScrollController();
  int _ListMaxLimit = 3;
  List<HorizontalItemsList> _listScrollableItems = [];
  List _shrinkedList = [];

  @override
  void initState() {
    super.initState();

    widget.data!['scrollableItems'].forEach((key, value) {
      _listScrollableItems.add(HorizontalItemsList(
          sectionTitle: key,
          ListItemsMargin: EdgeInsets.only(right: 10.0),
          ListFramePadding: EdgeInsets.symmetric(horizontal: 15.0),
          itemsList: value));
    });

    // _shrinkedList = List.generate(3, (i) => _listScrollableItems[i]);
    _shrinkedList = [
      CarouselSection(items: widget.data!['Carousels']['FirstCarousel']),
      HorizontalItemsList(
          sectionTitle: "Watches",
          ListItemsMargin: EdgeInsets.only(right: 10.0),
          ListFramePadding: EdgeInsets.symmetric(horizontal: 15.0),
          itemsList: widget.data!['scrollableItems']['Watches']),
      WindowsCategorySection(items: widget.data!['Windows']['FirstWindow']),
      // ..._shrinkedList,
    ];

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("end");

        setState(() {
          if (_ListMaxLimit + 3 <= _listScrollableItems.length + (3)) {
            //NOTE values inside the paranteces are because of the three static added to the firts of the list
            for (int i = _ListMaxLimit; i < _ListMaxLimit + 3; i++) {
              _shrinkedList.add(_listScrollableItems[i - (3)]);
            }
            _ListMaxLimit += 3;
          }
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, val, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: cBackgroundGrey,
            appBar: MyAppBar(),
            body: ListView.builder(
                controller: _scrollController,
                itemCount: _ListMaxLimit,
                itemBuilder: (context, index) {
                  if (index == _ListMaxLimit &&
                      index != _listScrollableItems.length) {
                    return CupertinoActivityIndicator();
                  }
                  return _shrinkedList[index];
                }),
          );
        });
      });
    });
  }
}

// sum of two numbers
