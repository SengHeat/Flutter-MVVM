
import 'package:e_commerce_mvvm/data/repositories/product_repository.dart';
import 'package:e_commerce_mvvm/viewmodels/auth_viewmodel.dart';
import 'package:e_commerce_mvvm/views/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodels/product_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductViewModel productViewModel = Get.find<ProductViewModel>();

  // Fetch product details when the screen is initialized
  init() async {
    await productViewModel.getDetailProduct();
  }

  @override
  void initState() {
    super.initState();
    init(); // Call init to fetch initial data
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("User Name "),
            ),
            body: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  await init(); // Trigger refresh when pulling down
                },
                child: Column(
                    children: [

                      GestureDetector(
                        onTap: () {
                          Get.delete<ProductRepository>();
                          Get.delete<ProductViewModel>();
                          Get.back();
                        },
                        child: Container(
                          height: 300,
                          width: 400,
                          color: Colors.blue,
                        ),
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
