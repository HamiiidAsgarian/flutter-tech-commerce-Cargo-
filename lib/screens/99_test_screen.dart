import 'dart:convert';

// import 'package:commerce_app/widgets/forCategorySection.dart';
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
    Future<List<dynamic>> a = firstPageDataGet();
    // ignore: unnecessary_null_comparison
    return Scaffold(
        body: FutureBuilder(
            future: a,
            builder: (context, AsyncSnapshot<List> snapshot) {
              return ListView(children: maker(snapshot.data!));
            }));
  }
}

List<Widget> maker(List a) {
  List<Widget> aa = [];
  a.forEach((element) {
    aa.add(Container(
        color: Colors.amber,
        margin: EdgeInsets.only(bottom: 10),
        child: Text(element.toString())));
  });
  return aa;
}

Future<List> firstPageDataGet() async {
  var response = await http.get(Uri.parse("http://localhost:3000/firstpage"));
  var responseBody = response.body;
  var parsedJson = jsonDecode(responseBody);

  // Map carouselsData = parsedJson['Carousels'];
  Map scrollableItemsData = parsedJson['scrollableItems'];
  // Map windowsData = parsedJson['windows'];
  // List result = [carouselsData, scrollableItemsData, windowsData];
  // print(scrollableItemsData);
  List aaa = scrollableItemsData.values.first;
  return aaa;
}

// class Watches {
//   final String key;
//   final List<dynamic> val;

//   Watches({required this.key, required this.val});

//   factory Watches.fromJson(Map<String, List> json) {
//     return Watches(
//       key: json['key'] as String,
//       val: json['val'] as List<dynamic>,
//     );
//   }
// }
