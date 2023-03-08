import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gamewheel/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPerferencesLocal {
  static late SharedPreferences prefs;
  static final String themeLocal = "themeLocal";

  Future<void> initSharePerferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setTheme(String json) async {
    //  final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeLocal, json);
  }

  Future<String> getTheme() async {
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    String auth_token;
    auth_token = (prefs.getString(themeLocal))!;
    print("--------$auth_token");
    return auth_token;
  }

  saveLocaL(userModel data) async {
    await SharedPerferencesLocal().setTheme(jsonEncode(data.toJson()));
  }

  Future<userModel> readData({bool? en, bool? dark}) async {
    final data = await getTheme();
    // print("----->${jsonDecode(data)}");
    userModel model = userModel.fromJson(jsonDecode(data));

    model.en = en ?? model.en;
    model.dark = dark ?? model.dark;
    await setTheme(jsonEncode(model.toJson()));
    return model;
  }
}
