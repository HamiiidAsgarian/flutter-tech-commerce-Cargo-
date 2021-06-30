import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

////////////////////////////////////////////////////////////////////////////////////* Home Screen
enum panel { carousel, rowList, windows }

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const List<String> data = ['men', '2', '3', '4', 'men', '2', '3', '4'];
  final List<String> fakeList5 = List.generate(5, (index) => "number $index");

  call() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    // var a = ListView.builder(
    //   itemCount: testL.length,
    //   itemBuilder: (context, index) =>
    //       HorizontalItemsList(sectionTitle: "For men1", itemsList: testL),
    // );
    return Scaffold(
        backgroundColor: cBackgroundGrey,
        appBar: const MyAppBar(
          leadingIcon: Icon(
            MyFlutterApp.menu,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            print("object");
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Carousel(),
                HorizontalItemsList(
                  ListItemsMargin: EdgeInsets.only(right: 10),
                  ListFramePadding: EdgeInsets.symmetric(horizontal: 15),
                  sectionTitle: "For men",
                  itemsList: fakeList5,
                ),
                SizedBox(height: 10),

                WindowsCategorySection(),
                HorizontalItemsList(
                  sectionTitle: "1",
                  itemsList: fakeList5,
                ),
                // Expanded(
                //   child: ItemsColumnMaker(itemRows: fakeList1),
                // ),
              ],
            ),
          ),
        ));
  }
}

class ItemsColumnMaker extends StatelessWidget {
  final List<String>? itemRows;
  const ItemsColumnMaker({Key? key, this.itemRows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // cacheExtent: 500,
        scrollDirection: Axis.vertical,
        itemCount: itemRows!.length,
        itemBuilder: (context, index) => HorizontalItemsList(
              sectionTitle: itemRows![index],
              itemsList: List.generate(20, (index) => index.toString()),
            ));
  }
}
//********************************************************************** */
// // import 'package:commerce_app/style/my_flutter_app_icons.dart';
// // import 'package:commerce_app/widgets/appbar.dart';
// // import 'package:commerce_app/widgets/carousel.dart';
// // import 'package:commerce_app/widgets/forCategorySection.dart';
// // import 'package:commerce_app/widgets/windows_category-section.dart';
// import 'package:flutter/material.dart';

// // import '../consts.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   GlobalKey<NavigatorState> key1 = new GlobalKey();

//   GlobalKey<NavigatorState> key2 = new GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     // );
//     return Scaffold(
//         body: PageView(
//       children: [page1(gkey: key1), page2(gkey: key2)],
//     ));
//   }
// }

// class page1 extends StatelessWidget {
//   const page1({Key? key, required this.gkey}) : super(key: key);
//   final GlobalKey<NavigatorState> gkey;
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(onGenerateRoute: (RouteSettings setting) {
//       return MaterialPageRoute(builder: (context) {
//         return Container(
//           color: Colors.green,
//           child: Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     gkey.currentState?.pushNamed("/");
//                   },
//                   child: Text("go"))),
//         );
//       });
//     });
//   }
// }

// class page2 extends StatelessWidget {
//   const page2({Key? key, required this.gkey}) : super(key: key);
//   final GlobalKey<NavigatorState> gkey;
//   @override
//   Widget build(BuildContext context) {
//     print(gkey.currentContext);
//     return Navigator(onGenerateRoute: (RouteSettings setting) {
//       return MaterialPageRoute(builder: (context) {
//         return Container(
//           color: Colors.blue,
//           child: Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     gkey.currentState?.pushNamed("/Item");
//                   },
//                   child: Text("go"))),
//         );
//       });
//     });
//   }
// }

// class page3 extends StatelessWidget {
//   const page3({Key? key, this.color}) : super(key: key);
//   final Color? color;
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(onGenerateRoute: (RouteSettings setting) {
//       return MaterialPageRoute(builder: (context) {
//         return Container(
//           color: Colors.red,
//           child: Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("back"))),
//         );
//       });
//     });
//   }
// }
