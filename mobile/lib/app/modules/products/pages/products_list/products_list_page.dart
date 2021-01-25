import 'package:auto_size_text/auto_size_text.dart';
import 'package:crimson_labs/app/core/components/appbar/custom_appbar.dart';
import 'package:crimson_labs/app/core/components/buttons/main_button.dart';
import 'package:crimson_labs/app/modules/products/pages/products_list/components/product_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'products_list_controller.dart';

class ProductsListPage extends StatefulWidget {
  @override
  _ProductsListPageState createState() => _ProductsListPageState();
}

class _ProductsListPageState extends ModularState<ProductsListPage, ProductsListController> {

  @override
  void initState() {
    super.initState();
    controller.fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "Products",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (controller.productListLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  else if (controller.fetchingError != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: AutoSizeText(
                            "${controller.fetchingError}",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5),
                        MainButton(
                          text: "Try Again",
                          onTap: () => controller.fetchProductList()
                        )
                      ],
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: controller.fetchProductList,
                    child: ListView.builder(
                      itemCount: controller.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductListItemWidget(
                          item: controller.productList[index],
                        );
                      },
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
