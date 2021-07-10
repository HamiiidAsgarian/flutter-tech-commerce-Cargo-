import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderModel extends ChangeNotifier {
  int a = 1;
  // int appBarSelectedIndex = 0;
  // PageController pgc = PageController(
  //   initialPage: 0,
  // );

  // void onItemTapped(int index) {
  //   appBarSelectedIndex = index;
  //   print("Provider Nav index: $appBarSelectedIndex");

  //   pgc.jumpToPage(index);

  //   notifyListeners();
  // }

  Future<Map<String, dynamic>> getDataFromApi({String url = ""}) async {
    var response = await http.get(Uri.parse(url));

    var responseBody = response.body;
    Map<String, dynamic> parsedJson = jsonDecode(responseBody);

    // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return parsedJson;
  }
}
