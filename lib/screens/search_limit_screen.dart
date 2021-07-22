import 'package:commerce_app/widgets/my_rounded_button/my_rounded_button.dart';
import 'package:commerce_app/widgets/my_rounded_textfield/my_rounded_textfield.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class SearchLimitScreen extends StatefulWidget {
  SearchLimitScreen({
    this.data,
    required this.function,
    this.sliderMin,
    this.slidermax,
    this.statusCheckValue,
    this.filterText,
  });
  final List? data;
  final Function function;

  final int? sliderMin;
  final int? slidermax;
  final bool? statusCheckValue;
  final String? filterText;

  @override
  _SearchLimitScreenState createState() => _SearchLimitScreenState();
}

class _SearchLimitScreenState extends State<SearchLimitScreen> {
  final List<bool> _isOpen = [false, false];
  static const double sliderStartingRange = 0;
  static const double sliderEndingRange = 500;

  String? searchedText;
  late int _sliderMin;
  late int _slidermax = widget.slidermax!;
  late bool _statusCheckValue = widget.statusCheckValue!;
  late String _filterText;

  @override
  void initState() {
    super.initState();
    _sliderMin = widget.sliderMin!;
    _slidermax = widget.slidermax!;
    _statusCheckValue = widget.statusCheckValue!;
    _sliderMin = widget.sliderMin!;
    _filterText = widget.filterText!;
  }

  TextEditingController filterTextCNTRLR = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    filterTextCNTRLR.text = _filterText;
    filterTextCNTRLR.selection = TextSelection.fromPosition(
        TextPosition(offset: filterTextCNTRLR.text.length));

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
        title: const Align(child: Text("Search Limit")),
      ),
      body: ListView(children: [
        const Divider(height: 0),
        // const SizedBox(height: 20),
        Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
            child: MyRoundedTextfield(

                //       cntrl.selection =
                // TextSelection.fromPosition(TextPosition(offset: cntrl.text.length));
                cntrl: filterTextCNTRLR,
                value: _filterText,
                hint: "Search Product",
                func: (e) {
                  setState(() {
                    _filterText = e;
                  });
                }

                // (String e) {
                //   setState(() {
                //     searchedText = e;
                //   });
                // },
                //  ,
                // // textInputType: TextInputType.text,
                // hint: "Searching in Fashion category",
                // func: (String e) {
                //   setState(() {
                //     searchedText = e;
                //   });
                // print(testText);
                // },
                )),
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
                        hint: _sliderMin.toString(),
                        func: (String e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) < _slidermax && int.parse(e) >= 0
                                ? _sliderMin = int.parse(e)
                                : Container();
                          });
                        },
                        value: _sliderMin,
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: SearchField2(
                        textInputType: TextInputType.number,
                        hint: _slidermax.toString(),
                        func: (String e) {
                          setState(() {
                            // ignore: unnecessary_statements
                            int.parse(e) > _sliderMin && int.parse(e) <= 500
                                ? _slidermax = int.parse(e)
                                : Container();
                          });
                        },
                        value: _slidermax,
                      ))
                    ]),
                  ),
                  const SizedBox(height: 20),
                  RangeSlider(
                    min: sliderStartingRange,
                    max: sliderEndingRange,
                    values: RangeValues(
                        _sliderMin.toDouble(), _slidermax.toDouble()),
                    onChanged: (e) {
                      // print(e);
                      setState(() {
                        _sliderMin = e.start.toInt();
                        _slidermax = e.end.toInt();
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: MyRoundedButton(
              title: "Register",
              function: () {
                widget.function(
                  [
                    _sliderMin == sliderStartingRange ? null : _sliderMin,
                    _slidermax == sliderEndingRange ? null : _slidermax,
                    _statusCheckValue == false ? null : _statusCheckValue,
                    _filterText == "" ? null : _filterText
                  ],
                );
                Navigator.pop(context);
              }),
        ) //NOTE 00 - seach filter func
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
