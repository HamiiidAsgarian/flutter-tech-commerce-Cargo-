import 'dart:io';

import 'package:commerce_app/consts.dart';
import 'package:commerce_app/widgets/my_rounded_button/my_rounded_button.dart';
import 'package:commerce_app/widgets/my_rounded_textfield/my_rounded_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'dart:js' as js;

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                    // color: Colors.amber,
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/AR.png",
                            fit: BoxFit.fill))),
                Text(
                  "Lampstack©️ 2021",
                  style: itemTitleFontStyle.copyWith(
                      color: Colors.blueGrey.withOpacity(0.5)),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: MyRoundedButton(
                      title: "Sign in into account",
                      function: () {
                        print("Profile screen");
                      },
                    )),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      children: [
                    [
                      Text(
                        'About Us',
                        style: itemBrandFontStyle.copyWith(fontSize: 17),
                      ),
                      Icon(
                        Icons.table_chart_outlined,
                        color: Colors.grey[700],
                      )
                    ],
                    [
                      Text(
                        'version',
                        style: itemBrandFontStyle.copyWith(fontSize: 17),
                      ),
                      Icon(
                        Icons.upgrade_outlined,
                        color: Colors.grey[700],
                      )
                    ],
                    [
                      Text(
                        'Contact',
                        style: itemBrandFontStyle.copyWith(fontSize: 17),
                      ),
                      Icon(
                        Icons.support_agent,
                        color: Colors.grey[700],
                      )
                    ],
                    [
                      Text(
                        'Our team',
                        style: itemBrandFontStyle.copyWith(fontSize: 17),
                      ),
                      Icon(
                        Icons.group_outlined,
                        color: Colors.grey[700],
                      )
                    ],
                  ]
                          .map(
                            (List<Widget> e) => Column(children: [
                              RawMaterialButton(
                                onPressed: () async {
                                  // if (kIsWeb) {
                                  //   js.context.callMethod('open',
                                  //       ['https://github.com/HamiiidAsgarian']);
                                  //   print("platform is windows");
                                  // } else
                                  if (Platform.isAndroid) {
                                    const url =
                                        'https://github.com/HamiiidAsgarian';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  }
                                },
                                child: Container(
                                  // color: Colors.red,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                  padding: EdgeInsets.all(7),
                                                  color: Colors.grey[200],
                                                  child: e[1]
                                                  //  Icon(e[1],
                                                  //     color: Colors.grey[700])
                                                  ),
                                            ),
                                            SizedBox(width: 10),
                                            e[0]
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: Colors.grey[700],
                                        )
                                      ]),
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: Colors.grey[200],
                                // height: 10,
                              )
                            ]),
                          )
                          .toList()),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}

class IcondataString {
  IconData? iconData;
  String? string;

  IcondataString({this.iconData, this.string});
}

void regiserationPopup(BuildContext context, Function function) {
  final TextEditingController textcntrl = TextEditingController();
  {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                //NOTE: Sort registration
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    color: Colors.white, //NOTE Title section color
                    child: ListTile(
                      title: Center(
                          child: Text("Sort",
                              style:
                                  itemBrandFontStyle.copyWith(fontSize: 25))),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.cancel, size: 25)),
                    ),
                  ),
                  // const Divider(height: 0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FittedBox(
                            child: Text("Registeration",
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 25)),
                          ),
                          const SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: MyRoundedTextfield(
                                cntrl: textcntrl, func: (e) {}, hint: "hint"),
                          ),
                          const SizedBox(height: 25),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: MyRoundedButton(
                                  title: "Search Limit", function: function)),
                        ],
                      ),
                    ),
                  )
                ]),
              ));
        });
  }
}

List<Widget> listMaker(
    {required List<IcondataString> list,
    bool myIcon = true,
    context,
    Function? function}) {
  return list
      .map(
        (IcondataString listItem) => TextButton(
          onPressed: () {
            regiserationPopup(context, function!);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            color: Colors.blue[50]!.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                if (myIcon == true)
                  Icon(listItem.iconData, size: 20, color: Colors.black87)
                else
                  Container(),
                const SizedBox(width: 5),
                Text(listItem.string.toString(),
                    style: itemTitleFontStyle.copyWith(
                        fontSize: 16, color: Colors.black87)),
              ],
            ),
          ),
        ),
      )
      .toList();
}
