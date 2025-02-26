

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? confirmPassword;
  String? createdAt;
  String? updatedAt;
  String? image;
  XFile? imageFile;
  String? type;
  String? phone;
  String? phoneCode;
  String? firstName;
  String? lastName;
  String? gender;
  bool? acceptedTermsConditions;
  String? apiToken;
  String? deviceToken;
  String? dateOfBirth;
  String? nationality;
  String? maritalStatus;
  String? disabilityOrIllness;
  String? referralCode;
  String? userConditions;
  int? productId;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.imageFile,
    this.type,
    this.phone,
    this.phoneCode,
    this.firstName,
    this.lastName,
    this.gender,
    this.acceptedTermsConditions,
    this.apiToken,
    this.deviceToken,
    this.dateOfBirth,
    this.nationality,
    this.maritalStatus,
    this.disabilityOrIllness,
    this.referralCode,
    this.userConditions,
    this.productId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'] ?? "$firstName $lastName";
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    type = json['type'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    gender = json['gender'];
    acceptedTermsConditions = json['accepted_terms_conditions'];
    apiToken = json['token'];
    deviceToken = json['device_token'];
    dateOfBirth = json['date_of_birth'];
    nationality = json['nationality'];
    maritalStatus = json['marital_status'];
    disabilityOrIllness = json['disability_or_illness'];
    referralCode = json['referral_code'];
    userConditions = json['user_conditions'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['type'] = type;
    data['phone'] = phone;
    data['phone_code'] = phoneCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['accepted_terms_conditions'] = acceptedTermsConditions;
    data['api_token'] = apiToken;
    data['device_token'] = deviceToken;
    data['date_of_birth'] = dateOfBirth;
    data['nationality'] = nationality;
    data['marital_status'] = maritalStatus;
    data['disability_or_illness'] = disabilityOrIllness;
    data['referral_code'] = referralCode;
    data['user_conditions'] = userConditions;
    data['product_id'] = productId;
    return data;
  }

  Map<String, String> toJsonRegister() {
    return {
      "firstname": firstName ?? "",
      "lastname": lastName ?? "",
      "email": email ?? "",
      "password": password ?? "",
      "confirm_password": confirmPassword ?? "",
      "device_token": "",
    };
  }

  Map<String, dynamic> toJsonLogin() {
    return {
      "email": email,
      "password": password,
      "device_token": "",
    };
  }

   Map<String, dynamic> toJsonAppleLogin() {
    return {
      "identity_token": "",
      "device_token": "",
    };
  }

  Map<String, dynamic> toJsonGoogleLogin() {
    return {
      "access_token": "",
      "device_token": "",
    };
  }

  Map<String, dynamic> toJsonFacebookLogin() {
    return {
      "access_token": "",
      "device_token": "",
    };
  }

  Map<String, dynamic> toJsonVerifyOTP() {
    return {
      "email": email,
      "otp": ""
    };
  }

   Map<String, dynamic> toJsonRequestOTP() {
    return {
      "email": email,
    };
  }

}