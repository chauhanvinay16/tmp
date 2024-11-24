
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStore {
  static Future<bool> initManager()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    Get.put(pref);
    return true;
  }

  static setlanhuagecode(String languagecode){
    SharedPreferences pref=Get.find();
    pref.setString("language_code", languagecode);
  }

  static String getlanguagecode(){
    SharedPreferences pref=Get.find();
    return pref.getString('language_code')??"";
  }

  static setcountrycode(String countrycode){
    SharedPreferences pref=Get.find();
    pref.setString("country_code", countrycode);
  }

  static String getcountrycode(){
    SharedPreferences pref=Get.find();
    return pref.getString('country_code')??"";
  }

  static removetitle(){
    SharedPreferences pref=Get.find();
    pref.remove("language_code");
    pref.remove("country_code");
  }
}