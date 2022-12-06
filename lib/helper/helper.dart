import 'package:shared_preferences/shared_preferences.dart';

class Helper_funciones {
  //Llaves
  static String userLoggedInkey = "LOGGEDINKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USEREMAILKEY";

  //getter
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInkey);
  }
}
