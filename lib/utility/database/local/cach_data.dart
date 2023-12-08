import 'dart:convert';

import 'cache_helper.dart';

/*
class CachingDataManager {
  CachingDataManager._();

  static CachingDataManager instance = CachingDataManager._();

  void cachLoginInfo(LoginModel loginModel) async {
    await CacheHelper.put(
        key: "loginModel", value: jsonEncode(loginModel.toJson()));
  }

  LoginModel getLoginModel() {
    String data = CacheHelper.getDataString(key: "loginModel");
    return LoginModel.fromJson(jsonDecode(data));
  }
}
*/
