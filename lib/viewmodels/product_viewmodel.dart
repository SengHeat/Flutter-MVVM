

import 'package:e_commerce_mvvm/data/models/api_model/product_model.dart';
import 'package:e_commerce_mvvm/data/models/response/base/status_request.dart';
import 'package:e_commerce_mvvm/data/repositories/product_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductViewModel extends GetxController {
  final ProductRepository productRepository;
  final SharedPreferences sharedPreferences;
  ProductViewModel({required this.productRepository, required this.sharedPreferences});

  final List<ProductModel> _productModelList = <ProductModel>[];
  ProductModel _productModelDetail = ProductModel();
  List<ProductModel> get productModelList => _productModelList;
  ProductModel get productModelDetail => _productModelDetail;
  StatusRequest statusGetDetail = StatusRequest.loading;
  StatusRequest statusGetAll = StatusRequest.loading;
  StatusRequest statusPostSave = StatusRequest.loading;
  int cListPage = 1;

  _setMainProduct(List<ProductModel> products) {
    _productModelList.addAll(products);
    update();
  }

  _setDetailProduct(ProductModel product) {
    _productModelDetail = product;
    update();
  }

  _refreshProduct() {
    _productModelList.clear();
    update();
  }

  _setUpdateProduct(ProductModel productModel) {
    for (int i = 0; i < _productModelList.length; i++) {
      if (_productModelList[i].id == productModel.id) {
        _productModelList[i] = productModel;
        update();
        break;
      }
    }
  }

  Future<void> getAllProduct({bool refresh = false}) async {
    statusGetAll = StatusRequest.loading;
    update();
    if(refresh) {
      _refreshProduct();
    }
    if(statusGetAll == StatusRequest.noMore) return;
    await productRepository.getAll(page: cListPage)
        .then((value) {
          statusGetAll = StatusRequest.success;
           if(value.currentPage < value.lastPage) {
             cListPage ++;
           } else {
             statusGetAll = StatusRequest.noMore;
           }
           _setMainProduct(value.lists);
        })
        .catchError((error) {
          statusGetAll = StatusRequest.error;
          _setMainProduct([ProductModel()]);
        }
    ).whenComplete(() => update());
  }


  Future<void> getDetailProduct() async {
    statusGetDetail = StatusRequest.loading;
    update();

    await productRepository.findOne().then((value) {
      if (value.id == null) {
        statusGetDetail = StatusRequest.empty;
      } else {
        _setDetailProduct(value);
        statusGetDetail = StatusRequest.success;
      }
    }).catchError((error) {
      statusGetDetail = StatusRequest.error;
      _setDetailProduct(ProductModel());
    }).whenComplete(() {
      update();
    });
  }

  Future<void> saveUnSaveProduct(ProductModel productModel) async {
    statusPostSave = StatusRequest.loading;
    update();
    await productRepository.saveUnSaveProduct(productModel)
        .then((value) {
          if(value == StatusRequest.success) {
            productModel.isFeatured = !productModel.isFeatured;
            _setUpdateProduct(productModel);
            statusPostSave = StatusRequest.success;
          } else {
            statusPostSave = StatusRequest.error;
          }
    }).catchError((error){
      statusPostSave = StatusRequest.error;
    })
        .whenComplete(() => update()
    );
  }

}