import 'package:flutter/cupertino.dart';

class ProviderModel extends ChangeNotifier {
  int appBarSelectedIndex = 0;
  PageController pgc = PageController(
    initialPage: 0,
  );

  void onItemTapped(int index) {
    appBarSelectedIndex = index;
    print("Provider Nav index: $appBarSelectedIndex");

    pgc.jumpToPage(index);

    notifyListeners();
  }
}
