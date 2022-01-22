import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_info/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:user_info/utils/enums.dart';
import 'package:user_info/utils/strings.dart';

class UserProvider extends ChangeNotifier {
  //
  List<User> userList = [];
  List<User> searchList = [];
  Status userFetchStatus = Status.IDLE;
  //
  getUserList() async {
    print("get user list");
    _setUsetFetchStatus(Status.LOADING);
    try {
      bool result = await _checkUserList();
      if (result) {
        _getUserListFromLocal();
      } else {
        await _getUserListFromNetwork();
      }
      _setUsetFetchStatus(Status.SUCCESS);
    } catch (e) {
      print(e);
      _setUsetFetchStatus(Status.FAILED);
    }
  }

  //
  _getUserListFromNetwork() async {
    print("User List from network");
    http.Response response = await http.get(Uri.parse(Strings.BASE_URL));
    print(response.statusCode);
    if (response.statusCode == 200) {
      userList = [];
      List tmp = jsonDecode(response.body);
      tmp.forEach((element) async {
        User user = User.fromJson(element);
        userList.add(user);
        await _setUserListToLocal(user);
      });
    }
  }

  searchUser(String searchText) {
    if (userList.isNotEmpty) {
      searchList = userList
          .where((element) =>
              element.name!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.email!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  _getUserListFromLocal() async {
    print("User List from Local");
    var db = await Hive.openBox<User>("userlist");
    userList = db.values.toList();
  }

  Future<bool> _checkUserList() async {
    var db = await Hive.openBox<User>("userlist");
    if (db.isNotEmpty) {
      print("User in Local");
      return true;
    } else {
      print("User not in Local");
      return false;
    }
  }

  _setUserListToLocal(User data) async {
    var db = await Hive.openBox<User>("userlist");
    db.add(data);
  }

  _setUsetFetchStatus(Status status) {
    userFetchStatus = status;
    notifyListeners();
  }
}
