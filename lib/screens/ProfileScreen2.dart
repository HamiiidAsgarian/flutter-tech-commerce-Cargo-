import 'package:commerce_app/consts.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  listMaker(List list, bool myIcon) {
    return list
        .map(
          (listItem) => TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  myIcon == true
                      ? Icon(listItem[1], size: 30, color: appBargrey)
                      : Container(),
                  SizedBox(width: 5),
                  Text(listItem[0],
                      style: itemTitleFontStyle.copyWith(fontSize: 18)),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Icon(Icons.access_alarm, size: 50)),
          // SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: MyRoundedButton()),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                children: listMaker([
              ['Price Changes', Icons.timelapse],
              ['Favorites', Icons.favorite],
              ['Recent views', Icons.receipt_long],
              ['Setting', Icons.settings],
            ], true)),
          ),
          Container(
              color: appBargrey,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                children: listMaker([
              ['About Us', MyFlutterApp.bell_alt],
              ['Contacts', MyFlutterApp.bell_alt],
              ['Version', MyFlutterApp.bell_alt],
              ['Our team', MyFlutterApp.bell_alt],
            ], false)),
          )
        ])));
  }
}

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.orangeAccent[700],
        height: 40,
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text("Log In",
                style: itemTitleFontStyle.copyWith(
                    fontSize: 18, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
