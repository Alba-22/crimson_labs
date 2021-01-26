import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/components/appbar/custom_appbar.dart';
import 'package:crimson_labs/app/core/components/buttons/main_button.dart';
import 'package:crimson_labs/app/core/utils/validators.dart';

import '../../components/create_product_field.dart';
import 'products_add_controller.dart';

class ProductsAddPage extends StatefulWidget {
  @override
  _ProductsAddPageState createState() => _ProductsAddPageState();
}

class _ProductsAddPageState extends ModularState<ProductsAddPage, ProductsAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Registration"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          padding: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).accentColor,
                      size: 60,
                    ),
                    SizedBox(height: 5),
                    AutoSizeText(
                      "Click to add a photo.",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      "not implemented yet",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              CreateProductField(
                controller: controller.nameController,
                text: "Nome do Produto",
                icon: Icons.article_rounded,
                onChange: (_) => controller.checkValidation(),
                validator: validateProductName,
              ),
              CreateProductField(
                controller: controller.descriptionController,
                text: "Descrição do Produto",
                icon: Icons.description,
                onChange: (_) => controller.checkValidation(),
                validator: validateProductDescription,
                maxLines: null,
              ),
              CreateProductField(
                controller: controller.priceController,
                text: "Preço",
                icon: Icons.monetization_on_outlined,
                onChange: (_) => controller.checkValidation(),
                validator: (value) => validateProductPrice(value, "\$"),
                keyboardType: TextInputType.number,
              ),
              Observer(
                builder: (_) {
                  return MainButton(
                    text: "Adicionar Produto",
                    width: double.infinity,
                    isLoading: controller.addingProductLoading,
                    onTap: controller.canNext 
                    ? () async => await controller.addProduct() 
                    : null,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
