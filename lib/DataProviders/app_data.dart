import 'package:flutter/cupertino.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/models/item_directories.dart';
import 'package:metabox/models/user_model.dart';
import 'package:metabox/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {
  UserModel? userModel;
  SharedPreferences? sharedPreferences;
  List<ItemDirectories>? itemList;

  int? selectedTab;

  void setUserModel(UserModel _userModel) {
    userModel = _userModel;
    notifyListeners();
  }

  void setPreferences(SharedPreferences _sharedPrefs) {
    sharedPreferences = _sharedPrefs;
    notifyListeners();
  }

  void setItemList(List<ItemDirectories> model) {
    itemList = model;
    notifyListeners();
  }

  void setSelectedTab(int i) {
    selectedTab = i;
    notifyListeners();
  }
}
