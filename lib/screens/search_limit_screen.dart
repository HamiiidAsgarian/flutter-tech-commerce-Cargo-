import 'package:commerce_app/widgets/my_rounded_textfield/my_rounded_textfield.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class SearchLimitScreen extends StatefulWidget {
  const SearchLimitScreen({Key? key}) : super(key: key);

  @override
  _SearchLimitScreenState createState() => _SearchLimitScreenState();
}

class _SearchLimitScreenState extends State<SearchLimitScreen> {
  final List<bool> _isOpen = [false, false];
  int sliderMin = 0;
  int slidermax = 500;
  String? testText;
  bool _statusCheckValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Container(),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)))
        ],
        title: const Align(child: Text("SearchLimit")),
      ),
      body: Column(children: [
        const Divider(height: 0),
        const SizedBox(height: 20),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            child: SearchField2(
              textInputType: TextInputType.text,
              hint: "Searching in Fashion category",
              func: (String e) {
                setState(() {
                  testText = e;
                });
                // print(testText);
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
                _isOpen[i] = !isOpen;
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: _isOpen[0],
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, _isOpen) => Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text("Price",
                          style: itemBrandFontStyle.copyWith(fontSize: 20))),
                ),
                body: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(children: [
                      Expanded(
                          child: SearchField2(
                        textInputType: TextInputType.number,
                        hint: sliderMin.toString(),
                        func: (String e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) < slidermax && int.parse(e) >= 0
                                ? sliderMin = int.parse(e)
                                : Container();
                          });
                        },
                        value: sliderMin,
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: SearchField2(
                        textInputType: TextInputType.number,
                        hint: slidermax.toString(),
                        func: (String e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) > sliderMin && int.parse(e) <= 500
                                ? slidermax = int.parse(e)
                                : Container();
                          });
                        },
                        value: slidermax,
                      ))
                    ]),
                  ),
                  const SizedBox(height: 20),
                  RangeSlider(
                    max: 500,
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
                  const SizedBox(height: 30) //NOTE gap 1
                ]),
              ),
              ExpansionPanel(
                  isExpanded: _isOpen[1],
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, _isOpen) => Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text("Status",
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 20))),
                      ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                        const SizedBox(height: 30) //NOTE gap 2
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
  final TextInputType? textInputType;
  SearchField2(
      {this.hint, this.icon, this.func, this.value, this.textInputType});
  final TextEditingController cntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    value != null
        ? cntrl.text = value.toString()
        : print("search input value is null");

    cntrl.selection =
        TextSelection.fromPosition(TextPosition(offset: cntrl.text.length));
    return MyRoundedTextfield(
        cntrl: cntrl, func: func, hint: hint, textInputType: textInputType);
  }
}



////////////////////////////
