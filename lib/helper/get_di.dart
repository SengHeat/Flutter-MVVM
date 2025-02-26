// ignore_for_file: prefer_collection_literals, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:e_commerce_mvvm/data/api/api_client.dart';
import 'package:e_commerce_mvvm/data/api/api_service.dart';
import 'package:e_commerce_mvvm/data/models/response/language_model.dart';
import 'package:e_commerce_mvvm/data/repositories/auth_repository.dart';
import 'package:e_commerce_mvvm/data/repositories/product_repository.dart';
import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:e_commerce_mvvm/viewmodels/auth_viewmodel.dart';
import 'package:e_commerce_mvvm/viewmodels/product_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => NetworkInfo(Get.find()));
  Get.lazyPut(() => sharedPreferences, fenix: true);
  Get.lazyPut(() => DioClient(appBaseUrl: AppConstants.baseURL, sharedPreferences: Get.find()), fenix: true);

  // Repository
  // Get.lazyPut(() => LanguageRepository());
  Get.lazyPut(() => AuthRepository(dioClient: Get.find(), sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => ProductRepository(dioClient: Get.find(), sharedPreferences: Get.find()), fenix: true);

  // Controller
  // Get.lazyPut(() => SplashController());
  // Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthViewModel(authRepository: Get.find(), sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => ProductViewModel(productRepository: Get.find(), sharedPreferences: Get.find()), fenix: true);

  Map<String, Map<String, String>> languages = Map();
  // for (LanguageModel languageModel in AppConstants.languages) {
  //   String jsonStringValues = await rootBundle.loadString('assets/languages/${languageModel.languageCode}.json');
  //   Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
  //   Map<String, String> _json = Map();
  //   mappedJson.forEach((key, value) {
  //     _json[key] = value.toString();
  //   });
  //   languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  // }
  return languages;
}
