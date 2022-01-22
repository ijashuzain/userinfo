import 'package:flutter/foundation.dart';
import 'package:user_info/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:user_info/utils/strings.dart';

class UserProvider extends ChangeNotifier {
  //
  List<User> userList = [];
  //
  getUserList() async {
    http.Response response = await http.get(Uri.parse(Strings.BASE_URL));
    print(response.body);
  }
}
