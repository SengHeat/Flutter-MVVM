// ignore_for_file: prefer_collection_literals, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:e_commerce_mvvm/data/api/api_client.dart';
import 'package:e_commerce_mvvm/data/api/api_service.dart';
import 'package:e_commerce_mvvm/data/models/response/language_model.dart';
import 'package:e_commerce_mvvm/data/repositories/auth_repository.dart';
import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:e_commerce_mvvm/viewmodels/auth_viewmodel.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => NetworkInfo(Get.find()));
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => DioClient(appBaseUrl: AppConstants.baseURL, sharedPreferences: Get.find(),));

  // Repository
  // Get.lazyPut(() => LanguageRepository());
  Get.lazyPut(() => AuthRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => ScholarshipRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => HomeRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => MatchingRepository(dioClient: Get.find(),sharedPreferences: Get.find()));
  // Get.lazyPut(() => ProfileRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => PaymentRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => NotificationRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => SlideShowRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => InAppPurchaseRepository(dioClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  // Get.lazyPut(() => SplashController());
  // Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthViewModel(authRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => ScholarshipController(scholarshipRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => HomeController(homeRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => MatchingController(matchingRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => ProfileController(profileRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => PaymentController(paymentRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => NotificationController(notificationRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => SlideShowController(slideShowRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => InAppPurchaseController(inAppPurchaseRepository: Get.find(), sharedPreferences: Get.find()));

  // Retrieving localized data
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
