import 'dart:convert';

import 'package:caffyne/dataModels.dart';
import 'package:http/http.dart' as http;

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> itemsInCart = [];

  fetchMenu() async {
    var url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var body = response.body;
      _menu = [];

      var decodedData = jsonDecode(body) as List<dynamic>;

      for (var json in decodedData) {
        _menu?.add(Category.fromJson(json));
      }
    }
  }

  Future<List<Category>> getMenu() async {
    if (_menu == null) {
      await fetchMenu();
    }

    return _menu!;
  }

  addToCart(Product p) {
    var found = false;

    for (var item in itemsInCart) {
      if (item.item.id == p.id) {
        item.quantity++;
        break;
      }
    }

    if (!found) {
      itemsInCart.add(ItemInCart(item: p, quantity: 1));
    }
  }

  removeFromCart(Product p) {
    itemsInCart.removeWhere((item) => item.item.id == p.id);
  }

  clearCart() {
    itemsInCart = [];
  }

  double cartTotal() {
    var sum = 0.0;

    for (var item in itemsInCart) {
      sum += item.quantity * item.item.price;
    }

    return sum;
  }
}
