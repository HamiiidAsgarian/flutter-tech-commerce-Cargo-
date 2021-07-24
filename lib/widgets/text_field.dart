import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  TextFieldWithIcon({this.hint, this.icon, required this.function});
  final Function function;
  final String? hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (e) => function(e),
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
        textAlign: TextAlign.left,
        // controller: searchCtrl,
        keyboardType: TextInputType.text,
        cursorColor: appBargrey,
        cursorRadius: Radius.zero,
        showCursor: true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),

          // isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: icon != null
                ? Icon(
                    icon,
                    size: 20,
                    color: appBargrey,
                  )
                : null,
          ),
          fillColor: greySearchbarBackground,
          filled: true,
          // border: InputBorder.none,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            //  BorderRadius.only(
            //     topLeft: Radius.circular(15),
            //     bottomLeft:
            //         Radius.circular(15)), //////////////////* left radius
            borderSide: BorderSide(
              // color: Colors.red,
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none,
          // errorBorder: InputBorder.none,
          // disabledBorder: InputBorder.none,
          // contentPadding:
          //     EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),

          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.red, width: 1.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green, width: 5.0),
          // ),
        ));
  }
}
/////////////////////////////////////////////

// class UnderlinedTextField extends StatelessWidget {
//   UnderlinedTextField(
//       {@required this.title,
//       this.color = Colors.white,
//       this.hint,
//       this.hintColor = Colors.blue});
//   final String? title;
//   final Color color;
//   final Color hintColor;

//   final hint;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         style: TextStyle(fontSize: 25, color: color),
//         decoration: InputDecoration(
//           labelStyle: TextStyle(fontSize: 16, color: color),
//           labelText: "$title",
//           hintStyle: TextStyle(color: hintColor),
//           hintText: hint,
//           contentPadding: EdgeInsets.only(left: 5, bottom: 2, top: 10),
//           isDense: true,
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: color, width: 1),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: color),
//           ),
//           border: UnderlineInputBorder(
//             borderSide: BorderSide(color: color),
//           ),
//         ),

//         // style: TextStyle(height: 0.1),
//       ),
//     );
//   }
// }
///////////////////////////////////////////////////////////

class AutoCompleteCustomInput extends StatelessWidget {
  AutoCompleteCustomInput(
      {this.hint, this.icon, required this.function, required this.listItems});
  final String? hint;
  final IconData? icon;
  final Function function;
  final List<dynamic> listItems;
  static List<String> a = [];
  static TextEditingController txtCNTRLR = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Autocomplete(optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == '') {
        return const Iterable<String>.empty();
      }
      listItems.forEach((element) {
        a.add(element['title']);
      });
      return a.where((String option) {
        return option
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase());
      });
    }, onSelected: (String e) {
      Map selectedItem = {};
      listItems.forEach((element) {
        if (element['title'] == e) {
          selectedItem = element;
        }
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ItemDetailScreen(
                  title: "XXXXX",
                  data:
                      selectedItem))); //REVIEW xxx can be deleted from the class
    },
        // onSelected: (String a) => print(a.runtimeType),
        fieldViewBuilder: (context, txtCNTRLR, focusNode, onEditingComplete) {
      // txtCNTRLR.text = "";

      return TextField(
          controller: txtCNTRLR,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          onChanged: (e) => function(e),
          style: TextStyle(color: Colors.grey, fontSize: 20),
          textAlign: TextAlign.left,
          // controller: searchCtrl,
          keyboardType: TextInputType.text,
          cursorColor: appBargrey,
          cursorRadius: Radius.zero,
          showCursor: true,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),

            // isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: icon != null
                  ? Icon(
                      icon,
                      size: 20,
                      color: appBargrey,
                    )
                  : null,
            ),
            fillColor: greySearchbarBackground,
            filled: true,
            // border: InputBorder.none,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              //  BorderRadius.only(
              //     topLeft: Radius.circular(15),
              //     bottomLeft:
              //         Radius.circular(15)), //////////////////* left radius
              borderSide: BorderSide(
                // color: Colors.red,
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ));
    }
        // ,optionsViewBuilder: (),
        );
  }
}
/////////////////////////////////////////////
