import 'package:flutter/material.dart';

import '../consts.dart';

class SearchLimitScreen extends StatefulWidget {
  const SearchLimitScreen({Key? key}) : super(key: key);

  @override
  _SearchLimitScreenState createState() => _SearchLimitScreenState();
}

class _SearchLimitScreenState extends State<SearchLimitScreen> {
  List<bool>? _isOpen = [false, false];
  int sliderMin = 0;
  int slidermax = 500;
  var testText;
  bool _statusCheckValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: Container(),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)))
        ],
        title: Align(alignment: Alignment(0.35, 0), child: Text("SearchLimit")),
      ),
      body: Column(children: [
        Divider(height: 0),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            child: SearchField2(
              hint: "Searching in Fashion category",
              func: (e) {
                setState(() {
                  testText = e;
                });
                print(testText);
              },
            )),
        Container(
          height: 20,
          //  color: Colors.amber
        ),
        Divider(height: 1, color: cBackgroundGrey),
        ExpansionPanelList(
            // dividerColor: (Colors.yellow),
            // expandedHeaderPadding: EdgeInsets.all(20),
            elevation: 1,
            expansionCallback: (i, isOpen) {
              setState(() {
                _isOpen?[i] = !isOpen;
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: _isOpen![0],
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, _isOpen) => Align(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text("Price",
                            style: itemBrandFontStyle.copyWith(fontSize: 20))),
                    alignment: Alignment.centerLeft),
                body: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: Row(children: [
                      Expanded(
                          child: SearchField2(
                        hint: sliderMin.toString(),
                        func: (e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) < slidermax && int.parse(e) >= 0
                                ? sliderMin = int.parse(e)
                                : print("slidermax>SliderMin");
                          });
                        },
                        value: sliderMin,
                      )),
                      SizedBox(width: 20),
                      Expanded(
                          child: SearchField2(
                        hint: slidermax.toString(),
                        func: (e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) > sliderMin && int.parse(e) <= 500
                                ? slidermax = int.parse(e)
                                : print("slidermax<SliderMin");
                          });
                        },
                        value: slidermax,
                      ))
                    ]),
                  ),
                  SizedBox(height: 20),
                  RangeSlider(
                    max: 500,
                    min: 0,
                    values:
                        RangeValues(sliderMin.toDouble(), slidermax.toDouble()),
                    onChanged: (e) {
                      print(e);
                      setState(() {
                        sliderMin = e.start.toInt();
                        slidermax = e.end.toInt();
                      });
                    },
                  ),
                  SizedBox(height: 30) //NOTE gap 1
                ]),
              ),
              ExpansionPanel(
                  isExpanded: _isOpen![1],
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, _isOpen) => Align(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text("Status",
                              style:
                                  itemBrandFontStyle.copyWith(fontSize: 20))),
                      alignment: Alignment.centerLeft),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: _statusCheckValue,
                                onChanged: (e) {
                                  setState(() {
                                    _statusCheckValue = e!;
                                  });
                                }),
                            Text("Available Items",
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 15)),
                          ],
                        ),
                        SizedBox(height: 30) //NOTE gap 2
                      ],
                    ),
                  ))
            ]),
      ]),
    );
  }
}

///////////////////////////////////////////////////---------------------------------
class SearchField2 extends StatelessWidget {
  final String? hint;
  final Widget? icon;
  final Function? func;
  final int? value;
  SearchField2({this.hint, this.icon, this.func, this.value});
  final TextEditingController cntrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    value != null
        ? cntrl.text = value.toString()
        : print("search input value is null");

    cntrl.selection =
        TextSelection.fromPosition(TextPosition(offset: cntrl.text.length));
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.redAccent,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        controller: cntrl,
        onChanged: (e) => this.func!(e), //NOTE search function
        style: TextStyle(color: cTextFieldTextColorGrey, fontSize: 20),
        textAlign: TextAlign.left,
        // controller: searchCtrl,
        keyboardType: TextInputType.text,
        cursorColor: appBargrey,
        cursorWidth: 2,
        cursorRadius: Radius.zero,
        showCursor: true,
        enableInteractiveSelection: true,
        decoration: new InputDecoration(
            // prefixIcon: Padding(
            //     padding: EdgeInsets.only(left: 15, right: 15),
            //     child: this.icon),
            fillColor: Colors.white, //NOTE Fill color
            filled: true,
            // border: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              //  BorderRadius.only(
              //     topLeft: Radius.circular(15),
              //     bottomLeft:
              //         Radius.circular(15)), //////////////////* left radius
              borderSide: BorderSide(width: 2, color: Colors.pink),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 2, color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.orange),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: cBackgroundGrey),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.black)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.yellowAccent)),
            contentPadding: EdgeInsets.only(left: 20), //NOTE Content padding

            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 1.0),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.green, width: 5.0),
            // ),
            hintText: this.hint,
            hintStyle: TextStyle(color: cBorderGrey, fontSize: 17)),
      ),
    );
  }
}

////////////////////////////
