import 'package:crimson_labs/app/modules/products/models/product_payload_model.dart';
import 'package:flutter/foundation.dart';

import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/core/services/client_http/client_http_interface.dart';

import '../models/product_response_model.dart';
import 'products_repository_interface.dart';

class ProductsRepository implements IProductsRepository {

  IClientHttp _clientHttp;

  ProductsRepository(this._clientHttp);

  @override
  Future<ResponseModel<ProductResponseModel>> getAllProducts() async {
    try {
      final response = await _clientHttp.get(
        "/products",
        headers: {
          "requiresToken": true
        }
      );
      return ResponseModel<ProductResponseModel>(
        data: ProductResponseModel.fromJson(response.data),
        statusCode: response.statusCode,
      );
    }
    catch (error) {
      debugPrint("ProductsRepository getAllProducts Error");
      throw Exception("There was an server error while loading products.");
    }
  }

  @override
  Future<ResponseModel> addProduct(ProductPayloadModel payload) async {
    try {
      final response = await _clientHttp.post(
        "/products",
        data: payload.toJson(),
        headers: {
          "requiresToken": true
        }
      );
      return ResponseModel(
        statusCode: response.statusCode,
      );
    }
    catch (error) {
      debugPrint("ProductsRepository addProduct Error");
      throw Exception("There was an server error while creating product.");
    }
  }
  
}