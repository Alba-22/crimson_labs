import 'package:crimson_labs/app/core/components/dialogs/common_dialog.dart';
import 'package:crimson_labs/app/core/utils/constants.dart';
import 'package:crimson_labs/app/modules/products/models/product_payload_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/core/utils/validators.dart';
import 'package:crimson_labs/app/modules/products/repositories/products_repository_interface.dart';

part 'products_add_controller.g.dart';

@Injectable()
class ProductsAddController = _ProductsAddControllerBase with _$ProductsAddController;

abstract class _ProductsAddControllerBase with Store {

  IProductsRepository _productsRepository;

  _ProductsAddControllerBase(this._productsRepository);
  
  @observable
  TextEditingController nameController = new TextEditingController();

  @observable
  TextEditingController descriptionController = new TextEditingController();

  @observable
  MoneyMaskedTextController priceController = new MoneyMaskedTextController(
    leftSymbol: "\$",
  );

  @observable
  TextEditingController tagsController = new TextEditingController();

  @observable
  bool _canNext = false;

  @observable
  bool _addingProductLoading = false;
  
  @action
  Future<void> addProduct() async {
    _addingProductLoading = true;
    final payload = ProductPayloadModel(
      title: nameController.text.trim(),
      description: descriptionController.text.trim(),
      price: double.parse(
        priceController.text.trim().replaceAll("\$", "").replaceAll(".", "").replaceAll(",", "."),
      ),
    ); 
    _productsRepository.addProduct(payload)
    .then((createdResponse) {
      if (createdResponse.statusCode == 201) {
        Modular.to.pop();
        Get.dialog(CommonDialog(
          type: DialogType.ok,
          text: "Success".toUpperCase(),
          subtext: "Product added successfully",
        ));
      }
      else {
        Get.dialog(CommonDialog(
          type: DialogType.error,
          text: "Error".toUpperCase(),
          subtext: "There was an error while creating product",
        ));
      }
    })
    .catchError((error) {
      Get.dialog(CommonDialog(
        type: DialogType.error,
        text: "Error".toUpperCase(),
        subtext: "There was an error while creating product",
      ));
    });
    _addingProductLoading = false;
  }

  @action
  checkValidation() {
    _canNext = validateProductName(nameController.text) == null
    && validateProductDescription(descriptionController.text) == null
    && validateProductPrice(priceController.text, "\$") == null;
  }

  @computed
  bool get canNext => _canNext;

  @computed
  bool get addingProductLoading => _addingProductLoading;

}
