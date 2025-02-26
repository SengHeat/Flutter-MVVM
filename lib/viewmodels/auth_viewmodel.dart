

import 'package:e_commerce_mvvm/data/models/api_model/user_model.dart';
import 'package:e_commerce_mvvm/data/repositories/auth_repository.dart';
import 'package:e_commerce_mvvm/utils/loading_dialog.dart';
import 'package:e_commerce_mvvm/views/user_profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends GetxController {
  final AuthRepository authRepository;
  late final SharedPreferences sharedPreferences;
  AuthViewModel({required this.authRepository, required this.sharedPreferences});

  UserModel userModel = UserModel();

  void _setUserMain(UserModel response) {
    userModel = response;
    if(Get.isDialogOpen ?? false) {
      Get.back();
    }
    update();
  }

  Future<void> login() async {
    try {
      UserModel userModel = UserModel(email: "heatblack009@gmail.com", password: "1234567890A");
      await authRepository.login(userModel)
          .then((value) => _setUserMain(value))
          .onError((error, stackTrace) => _setUserMain(UserModel()));
    } catch (e) {
      print("Login Error");
    }
  }

  Future<void> findUser() async {
    update();
    loadingDialogs(Get.context!);
    authRepository.findUser().then((value) {
      _setUserMain(value);
      Get.to(() =>  UserProfileScreen(), arguments: userModel.toJson());
    }).catchError((error) {
      _setUserMain(UserModel(firstName: "Okay"));
    });

  }
}