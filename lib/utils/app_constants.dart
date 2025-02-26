
import 'package:e_commerce_mvvm/data/models/response/language_model.dart';

String? frmTokenPublic;
String? apnsTokenPublic;
String? userIdPublic;
int? notificationId;

class AppConstants {

  static String appKey = "Pzu44rLMJgqDC47OWQCMZb1UPsaPse7LHsRPhFM6I70=";
  static const String playStore = "https://play.google.com/store/apps/details?id=com.scholarar.app&pcampaignid=web_share";
  static const String appStore = "https://apps.apple.com/kh/app/scholarar/id6602891343";

  static const String theme = "authenticator_theme";
  static String appName = "Scholarar";
  static const String baseURLPro =  "https://portal.scholarar.com";
  static const String baseURLDev =  "https://dev-portal.scholarar.com";
  static const String baseURLStaging =  "https://staging-portal.scholarar.com";
  // static String baseURL =  "https://dev-portal.scholarar.com";
  // static String baseURL = "https://pvt-portal.scholarar.com";
  //static String baseURL =  "https://portal.scholarar.com";
  static String baseURL = "https://staging-portal.scholarar.com";
  static const String getAllProduct = "/api/books";
  static const String getBookStore = "/api/books";
  static const String testVideoAPI = "/api/categories";
  static const String register = "/api/v1/register";
  static const String verifyRegisterOTP = "/api/v1/verify-otp-register";
  static const String resendOTPCode = "/api/v1/resend-otp";
  static const String login = "/api/v1/login";
  static const String loginWithGoogle = "/api/google-login";
  static const String loginWithFacebook = "/api/facebook-login";
  static const String loginWithApple = "/api/apple-login";
  static const String loginWithTelegram = "/api/telegram-login";
  static const String delete = "/api/v1/delete-account";
  static const String scholarshipRequirement = "/api/home-enquiry";
  static const String userInformation = "/api/student-info";
  static const String userCompleteInformation = "/api/profile-completion";
  static const String resetDeviceToken = "/api/v1/reset-device-token";
  static const String userReferralCode = "/api/generate-referral-code";
  static const String submitReferralCode = "/api/update-referral-code";

  static const String token = "token";
  static const String tranId = "tran_id";

  // auth
  static const String phoneSignIn = "";
  static const String sendVerificationSMS = "";
  static const String verificationCode = "";
  static const String phoneSignUP = "";
  static const String signOut = "/api/v1/logout";
  static const String userProfile = "/api/v1/user/profile";
  static const String sendOTPWithEmail = "/api/v1/forgot-password";
  static const String verifyOTPWithEmail = "/api/v1/verify-otp-forgotpassword";
  static const String changeUserName = "";
  static const String changeAvatar = "";
  static const String resetPassword = "/api/v1/reset-password";
  static const String changePassword = "";
  static const String forgetPassword = "";
  static const String deviceInfo = "";
  static const String changePhoneNumber = "";

  //payment
  static const String getPremiumPlan = "/api/v2/products";
  static const String orderPremiumPlan = "/api/order/create-payment-link";
  static const String verifyPayment = "/api/order/check-transaction-status?tran_id=";
  static const String aofAccountFile = "/api/v1/payway/aof/request";
  static const String aofAccountList = "/api/v1/payway/aof";
  static const String aofDefaultAccount = "/api/v1/payway/aof/set-default";
  static const String aofDeleteAccount = "/api/v1/payway/aof/remove";
  //in app purchase
  static const String verifyTransaction = "/api/in-app-purchase/verify";


  // course
  static const String getCourse = "/api/courses";
  static const String getCategory = "/api/categories";

  // qr code
  static const String getQRCode = "";
  static const String findQRCode = "";

  // country
  static const String getCountry = "/api/countries";

  // Setting
  static const String checkVersionApp = "";
  static const String uploadFile = "";

  //filter
  static const String countryId = "countryId";
  static const String destinationId = "destinationId";
  static const String majorId = "majorId";
  static const String degreeId = "degreeId";
  static const String typeId = "typeId";
  static const String universityId = "universityId";

  //matching form store data
  /*static const String firstname = "firstname";
  static const String lastname = "lastname";
  static const String gender = "gender";
  static const String birthday = "birthday";
  static const String nationality = "nationality";
  static const String destination = "destination";
  static const String degree = "degree";
  static const String major = "major";
  static const String graduate = "graduate";
  static const String gpa = "gpa";
  static const String ielts = "ielts";
  static const String toefl = "toefl";
  static const String sat = "sat";
  static const String institute = "institute";
  static const String ib = "ib";
  static const String futureMajor = "futureMajor";
  static const String futureDegree = "futureDegree";
  static const String workExperience = "workExperience";
  static const String researchExperience = "researchExperience";
  static const String responsibility = "responsibility";
  static const String publication = "publication";
  static const String internship = "internship";*/

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
