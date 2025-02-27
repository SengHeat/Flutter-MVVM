

import 'package:dio/dio.dart';
import 'package:e_commerce_mvvm/data/api/api_service.dart';
import 'package:e_commerce_mvvm/data/models/api_model/product_model.dart';
import 'package:e_commerce_mvvm/data/models/response/base/api_response.dart';
import 'package:e_commerce_mvvm/data/models/response/base/status_request.dart';
import 'package:e_commerce_mvvm/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository {

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  ProductRepository({required this.dioClient, required this.sharedPreferences});

  final String className = "ProductRepository";

  Future<PaginationData<ProductModel>> getAll({int page = 1}) async {
    try {
      final response = await dioClient.getData(AppConstants.token);
      if(response.data['status'] == 200) {
        // Assuming you have a response object that contains the list of products.
        PaginationData<ProductModel> products = PaginationData<ProductModel>.fromJson(
          response.data['data'],
              (json) => ProductModel.fromJson(json), // Pass the fromJson function for ProductModel
        );
        return products;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception("$className get all $e");
    }
  }

  Future<ProductModel> findOne() async {
    try  {
      final response = await dioClient.getData(AppConstants.token);
      if(response.data['status'] == 200) {
        ProductModel product = ProductModel.fromJson(response.data['data']);
        return product;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      throw Exception("$className find one $e");
    }
  }

  Future<StatusRequest> saveUnSaveProduct(ProductModel productModel) async {
    try {
      final response = await dioClient.postData(AppConstants.token, productModel.toSaveUnSaveJson());
      if(response.data['status'] == 200) {
        return StatusRequest.success;
      } else {
        return StatusRequest.error;
      }
    } catch (e) {
      return StatusRequest.error;
    }
  }
}