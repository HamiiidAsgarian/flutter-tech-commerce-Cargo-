import 'package:commerce_app/consts.dart';
import 'package:commerce_app/widgets/my_rounded_button/my_rounded_button.dart';
import 'package:commerce_app/widgets/my_rounded_textfield/my_rounded_textfield.dart';
import 'package:flutter/material.dart';

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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  // child: const Icon(Icons.access_alarm, size: 50),
                ),
                // SizedBox(height: 20),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: MyRoundedButton()),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      children: listMaker(list: [
                    IcondataString(
                        iconData: Icons.money, string: 'Price Changes'),
                    IcondataString(
                        iconData: Icons.favorite_border_outlined,
                        string: 'Favorites'),
                    IcondataString(
                        iconData: Icons.recent_actors, string: 'Recent views'),
                    IcondataString(
                        iconData: Icons.settings_applications_rounded,
                        string: 'Setting'),
                  ])),
                ),
                Container(
                    color: appBargrey,
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 20)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                      children: listMaker(list: [
                    IcondataString(string: 'About Us'),
                    IcondataString(string: 'Contacts'),
                    IcondataString(string: 'Version'),
                    IcondataString(string: 'Our team'),
                  ], myIcon: false, context: context)),
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

void regiserationPopup(BuildContext context) {
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
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: MyRoundedButton()),
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
    {required List<IcondataString> list, bool myIcon = true, context}) {
  return list
      .map(
        (IcondataString listItem) => TextButton(
          onPressed: () {
            regiserationPopup(context);
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
