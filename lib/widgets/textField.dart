import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String? hint;
  final IconData? icon;

  TextFieldWithIcon({this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (a) {},
      style: TextStyle(color: cBackgroundGrey, fontSize: 20),
      textAlign: TextAlign.left,
      // controller: searchCtrl,
      keyboardType: TextInputType.text,
      cursorColor: appBargrey,
      cursorWidth: 2,
      cursorRadius: Radius.zero,
      showCursor: true,
      enableInteractiveSelection: true,
      decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: this.icon != null
                ? Icon(
                    this.icon,
                    size: 23,
                    color: appBargrey,
                  )
                : null,
          ),
          fillColor: greySearchbarBackground,
          filled: true,
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            //  BorderRadius.only(
            //     topLeft: Radius.circular(15),
            //     bottomLeft:
            //         Radius.circular(15)), //////////////////* left radius
            borderSide: BorderSide(
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
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
    );
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
