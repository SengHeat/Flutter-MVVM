

import 'package:e_commerce_mvvm/data/api/api_service.dart';
import 'package:e_commerce_mvvm/data/models/api_model/user_model.dart';
import 'package:e_commerce_mvvm/helper/token_helper.dart';
import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  final TokenHelper _tokenHelper = TokenHelper();
  final String className = "AuthRepository";

  AuthRepository({required this.dioClient, required this.sharedPreferences});

  Future<UserModel> findUser() async {
    try {
      final response = await dioClient.getData(AppConstants.userProfile);
      if (response.data['status'].toString() == "200") {
        UserModel user = UserModel.fromJson(response.data['data']);
        return user;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception("$className login $e");
    }
  }

  Future<UserModel> register(UserModel userModel) async {

    XFile? imageFile = userModel.imageFile;
    if(imageFile == null) {
      return dioClient.postData(AppConstants.register, userModel.toJsonRegister())
          .then((value) {
        if (value.data['status'] == 200) {
          return UserModel.fromJson(value.data['data']);
        } else {
          throw Exception(value.data['message']);
        }
      }).catchError((error) {
        throw Exception("Error during login: $error");
      });
    } else {
      return dioClient.postMultipartData(AppConstants.login, userModel.toJsonRegister(), [MultipartBody('image', imageFile)])
          .then((value) {
        if (value.data['status'] == 200) {
          return UserModel.fromJson(value.data['data']);
        } else {
          throw Exception(value.data['message']);
        }
      }).catchError((error) {
        throw Exception("Error during login: $error");
      });
    }
  }

  Future<UserModel> login(UserModel userModel) {
    return dioClient.postData(AppConstants.login, userModel.toJsonLogin())
        .then((value) {
      if (value.data['status'] == 200) {
        if(value.data['data']['token'] != null) {
          _tokenHelper.saveToken(token: value.data['data']['token']);
        }
        return UserModel.fromJson(value.data['data']);
      } else {
        throw Exception(value.data['message']);
      }
    }).catchError((error) {
      throw Exception("Error during login: $error");
    });
  }
}