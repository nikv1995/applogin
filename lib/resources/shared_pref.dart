import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? pref;

  static Future<void> onInit() async {
    pref = await SharedPreferences.getInstance();
  }

  static setValue({required key, required value}) async {
    if (value is int) {
      await pref!.setInt(key, value);
    } else if (value is double) {
      await pref!.setDouble(key, value);
    } else if (value is bool) {
      await pref!.setBool(key, value);
    } else if (value is String) {
      await pref!.setString(key, value);
    } else if (value is List<String>) {
      await pref!.setStringList(key, value);
    } else {
      Fluttertoast.showToast(msg: 'Enter Valid Value');
    }
  }

  static int getInt(key) {
    return pref!.getInt(key) ?? 0;
  }

  static double getDouble(key) {
    return pref!.getDouble(key) ?? 0.0;
  }

  static String getString(key) {
    return pref!.getString(key) ?? '';
  }

  static bool getBool(key) {
    return pref!.getBool(key) ?? false;
  }

  static List getStringList(key) {
    return pref!.getStringList(key) ?? [];
  }

  static removeValue(key) {
    pref!.remove(key);
  }

  static clearPref() {
    pref!.clear();
  }
}
