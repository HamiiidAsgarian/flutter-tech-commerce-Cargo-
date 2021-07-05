import 'dart:convert';

import 'package:commerce_app/models/api_first_page_model.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    Future<ApiFirstPageModel> data = firstPageDataGet();
    // print(a);
    return Scaffold(
        body: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<ApiFirstPageModel> snapshot) {
              return ListView(children: maker(snapshot.data!));
            }));
  }
}

List<Widget> maker(ApiFirstPageModel a) {
  List<Widget> aa = [];
  a.scrollableItems.watches.forEach((element) {
    aa.add(Container(
        color: Colors.amber,
        margin: EdgeInsets.only(bottom: 10),
        child: Image.network(element.thumbnail)));
  });
  return aa;
}

///////////*/*/*/***/*/*/**/*/**/*//**//*////////////////////////////////
Future<ApiFirstPageModel> firstPageDataGet() async {
  var response = await http.get(Uri.parse("http://localhost:3000/firstpage"));

  var responseBody = response.body;
  var parsedJson = jsonDecode(responseBody);
  ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

  return ModeledData;
}
