import 'package:mobx/mobx.dart';

import 'package:crimson_labs/app/modules/products/models/product_response_model.dart';

part 'cart_store.g.dart';

// @Injectable()
class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  
  @observable
  ObservableList<Product> _cart = new ObservableList<Product>();

  @observable
  int _totalItems = 0;

  @observable
  double _totalPrice = 0;

  @action
  addItemToCart(Product item) {
    int exists = _cart.indexWhere((element) => element.sId == item.sId);
    if (exists == -1) {
      _cart.add(item);
    }
    else {
      _cart[exists].quantity++;
    }
    _totalItems++;
    _totalPrice += item.price;
  }

  @action
  increaseQuantity(int index) {
    final item = _cart[index].copyWith(
      quantity: _cart[index].quantity + 1,
    );
    _cart.removeAt(index);
    _cart.insert(index, item);
    _totalPrice += item.price;
  }

  @action
  decreaseQuantity(int index) {
    Product item = _cart[index];
    if (item.quantity == 1) {
      _cart.removeAt(index);
      _totalItems -= item.quantity;
      _totalPrice -= item.quantity * item.price;
    }
    else {
      item = _cart[index].copyWith(
        quantity: _cart[index].quantity - 1,
      );
      _cart.removeAt(index);
      _cart.insert(index, item);
      _totalPrice -= item.price;
    }
  }

  @computed
  ObservableList<Product> get cart => _cart;

  @computed
  int get totalItems => _totalItems;

  @computed
  double get totalPrice => _totalPrice;

}
