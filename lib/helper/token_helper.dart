// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TokenHelper {

  final storage = FlutterSecureStorage();
  final SharedPreferences sharedPreferences = Get.find();

  Future<void> saveToken({required String token}) async {
    final SharedPreferences sharedPreferences = Get.find();
    await storage.deleteAll();
    await sharedPreferences.remove(AppConstants.token);
    await storage.write(key: 'token', value: token);
    await sharedPreferences.setString(AppConstants.token, token);
  }

  Future<void> saveUUID({required String uuid}) async {
    await storage.deleteAll();
    await storage.write(key: 'uuid', value: uuid);
  }

  Future<void> saveData({required String key, required String value}) async {
    final SharedPreferences sharedPreferences = Get.find();
    await sharedPreferences.remove(key);
    await storage.write(key: key, value: value);
    await sharedPreferences.setString(key, value);
  }

  static List<String> convertStringToListString({required String data}) {
    return json.decode(data);
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    if (token != null) {
      await sharedPreferences.setString(AppConstants.token, token);
      return token;
    } else
      return null;
  }

  Future<String?> getUUID() async {
    String? uuid = await storage.read(key: 'uuid');
    if (uuid != null) {
      return uuid;
    } else
      return null;
  }

  Future<void> removeToken({bool isNotSignOut = true}) async {
    await storage.deleteAll();
    await sharedPreferences.remove(AppConstants.token);
    return;
  }

  Future<void> saveReferralCode({required String code}) async {
    final SharedPreferences sharedPreferences = Get.find();
    await storage.deleteAll();
    await sharedPreferences.remove(ReferralCodeKey.code);
    await storage.write(key: ReferralCodeKey.code, value: code);
    await sharedPreferences.setString(ReferralCodeKey.code, code);
  }

  Future<String> getReferralCode() async {
    String referralCode = await storage.read(key: ReferralCodeKey.code) ?? '';
    if (referralCode.isNotEmpty) {
      await sharedPreferences.setString(ReferralCodeKey.code, referralCode);
    }
    return referralCode;
  }

  Future<void> removeReferralCode() async {
    await storage.deleteAll();
    await sharedPreferences.remove(ReferralCodeKey.code);
  }


  Future<void> clearStorage() async {
    await storage.deleteAll();
    await sharedPreferences.remove(AppConstants.token);
    return;
  }

  Future<void> saveTranId({required String tranID}) async {
    final SharedPreferences sharedPreferences = Get.find();
    await sharedPreferences.remove(AppConstants.tranId);
    await storage.write(key: AppConstants.tranId, value: tranID);
    await sharedPreferences.setString(AppConstants.tranId, tranID);
  }

  Future<void> removeTranId() async {
    await storage.delete(key: "tran_id");
    await sharedPreferences.remove(AppConstants.tranId);
    return;
  }

  Future<String> getTranId() async {
    String tranId = await storage.read(key: AppConstants.tranId) ?? '';
    if (tranId.isNotEmpty) {
      await sharedPreferences.setString(AppConstants.tranId, tranId);
    }
    return tranId;
  }
}

class ReferralCodeKey{
  static const String code = 'referralCode';
}