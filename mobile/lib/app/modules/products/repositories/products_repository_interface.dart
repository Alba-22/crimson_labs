import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/modules/products/models/product_payload_model.dart';
import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';

abstract class IProductsRepository {
  Future<ResponseModel<ProductResponseModel>> getAllProducts();
  Future<ResponseModel> addProduct(ProductPayloadModel payload);
}