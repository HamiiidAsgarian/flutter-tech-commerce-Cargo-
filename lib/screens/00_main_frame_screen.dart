import 'package:commerce_app/screens/01_home_screen.dart';
import 'package:commerce_app/screens/02_category_Frame.dart';
import 'package:commerce_app/screens/03_search_screen_frame.dart';
import 'package:commerce_app/screens/04_Profile_screen.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_model.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage = 0;
  late Future<Map<String, dynamic>> _firstPageData;
  @override
  void initState() {
    super.initState();
    setState(() {
      _firstPageData = Provider.of<ProviderModel>(context, listen: false)
          .getDataFromApi(
              url: "http://api.npoint.io/6c77447c9c8e9dac5898/firstPage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //REVIEW
        bool res = false;

        a(e) {
          res = e;
          Navigator.pop(context);
        }

        print(ModalRoute.of(context)!.settings.name);
        if (ModalRoute.of(context)!.settings.name != "/") {
          Navigator.pop(context);
        } else
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      'Do you want to exit?',
                      textAlign: TextAlign.center,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () => a(true), child: Text("Exit")),
                        ElevatedButton(
                            onPressed: () => a(false), child: Text("Cancel"))
                      ],
                    ),
                  ));
        print(res);
        print(context);

        return res;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _firstPageData = Provider.of<ProviderModel>(context, listen: false)
                .getDataFromApi(
                    url: "http://api.npoint.io/6c77447c9c8e9dac5898/firstPage");
            print("firstScreen refreshed");
          });
        },
        child: Scaffold(
            extendBodyBehindAppBar: true,
            bottomNavigationBar: MyBottomNavigationBar(
              newvalue: currentpage,
              function: (int e) {
                setState(() {
                  currentpage = e;
                });
              },
            ),
            body: FutureBuilder(
                future: _firstPageData,
                builder:
                    (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  // if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return IndexedStack(
                      index: currentpage,
                      children: [
                        // TestScreen(),
                        HomeScreen(data: snapshot.data),
                        CategoryFramePage(),
                        SearchFramePage(),
                        ProfileScreen2(),
                      ],
                      // controller: pageController
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                  }
                  // }
                  print(snapshot.connectionState);
                  return Center(child: CupertinoActivityIndicator());
                })),
      ),
    );
    // });
  }
}
