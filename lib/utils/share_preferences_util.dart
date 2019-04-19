import 'package:shared_preferences/shared_preferences.dart';
class SPUtil{

  static Future<Null>  putString(String key,String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);

  }
  static Future<String> getString(String key) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = await prefs.getString(key);
    return value;
  }

  static Future<Null>  putInt(String key,int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);

  }
  static Future<int> getInt(String key) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = await prefs.getInt(key);
    return value;
  }

  static Future<Null>  putBool(String key,bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    var flag;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    flag = await prefs.getBool(key);
    if(flag==null){
      return false;
    }
    return flag;
  }



}