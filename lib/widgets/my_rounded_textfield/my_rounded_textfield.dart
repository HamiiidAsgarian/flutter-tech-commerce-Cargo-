import 'package:commerce_app/consts.dart';
import 'package:flutter/material.dart';

class MyRoundedTextfield extends StatelessWidget {
  const MyRoundedTextfield({
    Key? key,
    this.cntrl,
    this.func,
    this.hint,
    this.value = '',
    this.textInputType,
  }) : super(key: key);

  final TextEditingController? cntrl;
  final Function? func;
  final String? hint;
  final TextInputType? textInputType;
  final String value;

  @override
  Widget build(BuildContext context) {
    // if (value != null) {
    //   cntrl?.text = "value.toString()";
    // }
    return TextField(
      keyboardType: textInputType ?? null,
      controller: cntrl,
      onChanged: (e) => func!(e), //NOTE search function
      style: TextStyle(color: cTextFieldTextColorGrey, fontSize: 20),
      textAlign: TextAlign.left,
      // controller: searchCtrl,
      // keyboardType: TextInputType.text,
      cursorColor: appBargrey,
      cursorRadius: Radius.zero,
      showCursor: true,
      decoration: InputDecoration(
          // prefixIcon: Padding(
          //     padding: EdgeInsets.only(left: 15, right: 15),
          //     child: this.icon),
          fillColor: Colors.white, //NOTE Fill color
          filled: true,
          // border: InputBorder.none,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            //  BorderRadius.only(
            //     topLeft: Radius.circular(15),
            //     bottomLeft:
            //         Radius.circular(15)), //////////////////* left radius
            borderSide: BorderSide(width: 2, color: Colors.pink),
          ),
          focusedBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 2, color: Colors.grey),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          // errorBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(4),
          //   ),
          // ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellowAccent)),
          contentPadding:
              const EdgeInsets.only(left: 20), //NOTE Content padding

          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.red, width: 1.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green, width: 5.0),
          // ),
          hintText: hint,
          hintStyle: TextStyle(color: cBorderGrey, fontSize: 17)),
    );
  }
}
