import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderModel extends ChangeNotifier {
  List<Map> cartItems = [];
  // List<Map> cleanCartItems = [];

  addToCartList(Map item) {
    print(item['count']);
    var number = item['count'] != null ? item['count'] : 1;

    print(item['count']);

    cartItems.forEach((element) {
      if (element['title'] == item['title']) {
        // number++;
        cartItems = [
          ...cartItems,
          {...item, "count": number}
        ];
      }
    });

    // cleanCartItems
    //     .removeWhere((element) => (element['title'] == item['title']));

    // cleanCartItems = [
    //   ...cleanCartItems,
    //   {...item, "count": number}
    // ];

    notifyListeners();
  }

  discartItem(itemD) {
    if (itemD['count'] <= 1) {
      cartItems.removeWhere((element) => (element['title'] == itemD['title']));
    }

    // cartItems.removeWhere((element) => (element['title'] == itemD['title']));

    cartItems.forEach((element) {
      if (element['title'] == itemD['title']) {
        element['count'] = itemD['count'] - 1;
      }
    });

    // }
    notifyListeners();
    // }
  }

  Future<Map<String, dynamic>> getDataFromApi({String url = ""}) async {
    var response = await http.get(Uri.parse(url));

    var responseBody = response.body;
    Map<String, dynamic> parsedJson = jsonDecode(responseBody);

    // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return parsedJson;
  }

  Future<List> getDataFromApiToList({String url = ""}) async {
    var response2 = await http.get(Uri.parse(url));

    var responseBody1 = response2.body;
    var parsedJson1 = jsonDecode(responseBody1);
    // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return parsedJson1;
  }
}
