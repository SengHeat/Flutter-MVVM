

import 'package:e_commerce_mvvm/data/models/api_model/user_model.dart';
import 'package:e_commerce_mvvm/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // UserModel userData = UserModel.fromJson(Get.arguments);
  AuthViewModel authViewModel = Get.find<AuthViewModel>();

  init() async {
    await authViewModel.findUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("User Name ${authViewModel.userModel.name}"),
          ),
          body: Image.network(authViewModel.userModel.image ?? ""),
        );
      }
    );
  }
}
