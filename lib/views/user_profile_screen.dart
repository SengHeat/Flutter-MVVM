import 'package:e_commerce_mvvm/data/models/api_model/user_model.dart';
import 'package:e_commerce_mvvm/data/models/response/base/status_request.dart';
import 'package:e_commerce_mvvm/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // Initialize the ProductViewModel with GetX
  ProductViewModel productViewModel = Get.find<ProductViewModel>();

  // Fetch product details when the screen is initialized
  init() async {
    await productViewModel.getDetailProduct();
  }

  @override
  void initState() {
    super.initState();
    // init(); // Call init to fetch initial data
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("User Name"),
          ),
          body: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () async {
                await init(); // Trigger refresh when pulling down
              },
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 400,
                    color: Colors.black,
                  ),
                  Container(
                    height: 300,
                    width: 400,
                    color: Colors.black,
                  ),
                  Container(
                    height: 300,
                    width: 400,
                    color: Colors.black,
                  ),
                  Container(
                    height: 300,
                    width: 400,
                    color: Colors.black,
                  ),
                  Container(
                    height: 300,
                    width: 400,
                    color: Colors.black,
                  ),
                ]
              ),
            ),
          ),
        );
      }
    );
  }
}
