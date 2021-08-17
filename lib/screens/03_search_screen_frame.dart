import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/03_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFramePage extends StatefulWidget {
  const SearchFramePage({this.hasBack = false});
  final bool hasBack;

  @override
  _SearchFramePageState createState() => _SearchFramePageState();
}

class _SearchFramePageState extends State<SearchFramePage> {
  late Future<Map<String, dynamic>> _thirdPageData;
  @override
  void initState() {
    super.initState();

    _thirdPageData = Provider.of<ProviderModel>(context, listen: false)
        .getDataFromApi(url: "http://192.168.1.6:4000/thirdPage");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: FutureBuilder(
                  future: _thirdPageData,
                  builder:
                      (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      return SearchScreen(
                        data: snapshot.data!,
                        // title: "Category",
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          );
        });
      });
    });
  }
}
