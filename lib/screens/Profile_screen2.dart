import 'package:commerce_app/consts.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class IcondataString {
  IconData? iconData;
  String? string;

  IcondataString({this.iconData, this.string});
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  List<Widget> listMaker(List<IcondataString> list, bool myIcon) {
    return list
        .map(
          (var listItem) => TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  myIcon == true
                      ? Icon(listItem.iconData, size: 30, color: appBargrey)
                      : Container(),
                  const SizedBox(width: 5),
                  Text(listItem.string.toString(),
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: const Icon(Icons.access_alarm, size: 50)),
          // SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: const MyRoundedButton()),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                children: listMaker([
              IcondataString(
                  iconData: Icons.timelapse, string: 'Price Changes'),
              IcondataString(iconData: Icons.favorite, string: 'Favorites'),
              IcondataString(
                  iconData: Icons.receipt_long, string: 'Recent views'),
              IcondataString(iconData: Icons.settings, string: 'Setting'),
            ], true)),
          ),
          Container(
              color: appBargrey,
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                children: listMaker([
              IcondataString(iconData: Icons.timelapse, string: 'About Us'),
              IcondataString(
                  iconData: MyFlutterApp.bell_alt, string: 'Contacts'),
              IcondataString(
                  iconData: MyFlutterApp.bell_alt, string: 'Version'),
              IcondataString(iconData: Icons.timelapse, string: 'Our team'),
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
