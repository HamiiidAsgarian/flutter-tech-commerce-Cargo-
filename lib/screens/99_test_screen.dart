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
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("A")),
    );
  }
}

get() async {
  var response = await http.get(Uri.parse("http://localhost:3000/"));
  var b = response.body;
  print(b);
  print("----------------------");
  // print(json.decode(b));
}
