
import 'package:e_commerce_mvvm/data/models/response/language_model.dart';

String? frmTokenPublic;
String? apnsTokenPublic;
String? userIdPublic;
int? notificationId;

class AppConstants {

  static const String theme = "authenticator_theme";
  static String baseURL = "";

  static const String token = "token";
  static const String tranId = "tran_id";

  // translate
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "assets/images/logo_english.png",
        languageName: "English",
        countryCode: "US",
        languageCode: "en"),
    LanguageModel(
        imageUrl: "assets/images/logo_english.png",
        languageName: "Khmer",
        countryCode: "KH",
        languageCode: "km"),
    /*LanguageModel(
        imageUrl: "assets/images/logo_china.png",
        languageName: "简体中文",
        countryCode: "CN",
        languageCode: "zh")*/
  ];
}
