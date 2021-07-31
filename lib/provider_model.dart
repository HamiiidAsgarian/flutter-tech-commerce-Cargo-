import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProviderModel extends ChangeNotifier {
  List<Map<String, dynamic>> favoriteItems = [];

  List<Map<String, dynamic>> cartItems = [];
  double totalPriceNumber = 0;
  double totalPriceFee = 0;

//////////////////////////////////////////////////* favorite operators
  bool heartIconTriger(item) {
    bool res = false;
    favoriteItems.forEach((element) {
      if (element['title'] == item['title']) {
        res = true;
      } else
        res = false;
    });

    return res;
  }

  addToFavoritesList(Map item) {
    var foundedItem;

    for (Map<String, dynamic> e in favoriteItems) {
      if (e['title'] == item['title']) {
        foundedItem = e;
      }
    }
    if (foundedItem == null) {
      favoriteItems.add({...item});
    } else {
      favoriteItems.removeWhere((e) => e['title'] == item['title']);
      favoriteItems.add({...item});
    }
    // totalPrice();
    notifyListeners();
  }

  discartFavoriteItem(itemD) {
    favoriteItems
        .removeWhere((element) => (element['title'] == itemD['title']));
    // totalPrice();
    notifyListeners();
  }

////////////////////////////////////////////////* cart operators
  totalPrice() {
    double price = 0;
    cartItems.forEach((element) {
      price = price + element['price'] * element['count'];
    });
    notifyListeners();
    totalPriceNumber = price;
    totalPriceFee = totalPriceNumber * 0.05;
    return price;
  }

  addToCartList(Map item) {
    var foundedItem;

    for (Map<String, dynamic> e in cartItems) {
      if (e['title'] == item['title']) {
        foundedItem = e;
      }
    }
    if (foundedItem == null) {
      cartItems.add({...item, "count": 1});
    } else {
      cartItems.removeWhere((e) => e['title'] == item['title']);
      cartItems.add({...item, "count": foundedItem['count'] + 1});
    }
    totalPrice();
    notifyListeners();
  }

  discartItem(itemD) {
    cartItems.removeWhere((element) => (element['title'] == itemD['title']));
    totalPrice();
    notifyListeners();
  }

  countChange(item, String plusOrMines) {
    if (item['count'] > 1 && plusOrMines == '-') {
      for (var i = 0; i < cartItems.length; i++) {
        if (cartItems[i]['title'] == item['title']) {
          cartItems[i]['count'] = cartItems[i]['count'] - 1;
        }
      }
    }
    if (item['count'] < 100 && plusOrMines == '+') {
      for (var i = 0; i < cartItems.length; i++) {
        if (cartItems[i]['title'] == item['title']) {
          cartItems[i]['count'] = cartItems[i]['count'] + 1;
        }
      }
    }
    totalPrice();
    notifyListeners();
  }

  //////////////////////////*API operators

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
