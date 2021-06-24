import 'package:commerce_app/widgets/blackroundedbutton.dart';
import 'package:commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int? radioValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color:
                  Colors.white, //////////////////////// * MY cart section color

              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(left: 25, bottom: 15, top: 25),
            // margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Profile",
                  style: itemTitleFontStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700)),
              Text(" ",
                  style: itemTitleFontStyle.copyWith(
                      fontSize: 11, fontWeight: FontWeight.w500)),
            ]),
          ),
          Expanded(
            //////////////////////////////////////////////////* listview section
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  const SizedBox(height: 25),
                  CircleAvatar(
                    radius: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0.2, -1),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              child: TextButton(
                                onPressed: () => print("Camera"),
                                child: const CircleAvatar(
                                    radius: 17,
                                    child: Icon(Icons.camera_alt_rounded,
                                        size: 20)),
                              ),
                            ),
                          ),
                        )
                      ], //////////////////////////////////////////* image section
                    ),
                  ),
                  ////////////////////////////////////////////////* Name Section
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name', style: priceFontStyle),
                        TextFieldWithIcon(hint: "Name")
                      ],
                    ),
                  ), ////////////////////////////////////////////////* age Section
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Age', style: priceFontStyle),
                        TextFieldWithIcon(hint: "Age")
                      ],
                    ),
                  ) ////////////////////////////////////////////////* gender Section
                  ,
                  const SizedBox(height: 25),
                  const GenderRadioSection(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Address', style: priceFontStyle),
                        TextFieldWithIcon(hint: "Adress")
                      ],
                    ),
                  ),
                  const BlackRoundedButton(title: 'Confirm')
                ],
              ),
            ),
          )
        ],
      ),
    );
    // Divider(height: 1),]),
  }
}

//////////////////////////////////////////////////////////////////////////*w1: Gender
class GenderRadioSection extends StatefulWidget {
  const GenderRadioSection({Key? key}) : super(key: key);
  // final int a = 1;
  // int selectedIndex() {
  //   return a;
  // }

  @override
  _GenderRadioSectionState createState() => _GenderRadioSectionState();
}

class _GenderRadioSectionState extends State<GenderRadioSection> {
  int radioValue = 1;

  @override
  Widget build(BuildContext context) {
    final Column column =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Gender', style: priceFontStyle),
      Row(children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: greySearchbarBackground,
              child: RadioListTile(
                  title: Text("male",
                      style: itemBrandFontStyle.copyWith(fontSize: 16)),
                  value: 1,
                  activeColor: Colors.black,
                  selectedTileColor: Colors.amberAccent,
                  groupValue: radioValue,
                  onChanged: (int? a) {
                    setState(() {
                      radioValue = a!;
                    });
                  }),
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: greySearchbarBackground,
              child: RadioListTile(
                  title: Text("Female",
                      style: itemBrandFontStyle.copyWith(fontSize: 16)),
                  value: 2,
                  activeColor: Colors.black,
                  selectedTileColor: Colors.amberAccent,
                  groupValue: radioValue,
                  onChanged: (int? a) {
                    setState(() {
                      radioValue = a!;
                    });
                  }),
            ),
          ),
        )
      ])

      // Container(
      //   color: greySearchbarBackground,
      //   child: RadioListTile(
      //       title: Text("Male",
      //           style: itemBrandFontStyle.copyWith(fontSize: 16)),
      //       value: 1,
      //       groupValue: 1,
      //       onChanged: (a) {
      //         print(a);
      //       }),
      // ),
    ]);
    return column;
  }
}
