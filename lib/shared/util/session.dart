import 'package:hive/hive.dart';

late Box mainStorage;

class SessionManager {
  bool isLogin = mainStorage.get("isAdminLoggedIn") ?? false;

  saveLogin() {
    mainStorage.put("isAdminLoggedIn", true);
  }
}
