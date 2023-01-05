import '/core.dart';

class CartService {
  List cart = mainStorage.get("cart") ?? [];

  saveToLocalStorage() async {
    await mainStorage.put("cart", cart);
  }

  isCart(String id) {
    if (cart.indexWhere((element) => element["id"] == id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  addCart({
    required String id,
    required String name,
    required String price,
    required String type,
    required String photoUrl,
  }) {
    if (!isCart(id)) {
      cart.add({
        "id": id,
        "name": name,
        "price": price,
        "type": type,
        "photoUrl": photoUrl,
        "quantity": 1,
      });
    } else {
      addQuantity(id);
    }

    saveToLocalStorage();
    print('Successfully: $cart');
  }

  removeCart(String id) {
    cart.removeWhere((element) => element["id"] == id);
    saveToLocalStorage();
    print('Successfully: $cart');
  }

  addQuantity(String id) {
    var targetIndex = cart.indexWhere((waste) => waste["id"] == id);
    cart[targetIndex]["quantity"]++;
    saveToLocalStorage();
    print('Successfully: $cart');
  }

  reduceQuantity(String id) {
    var targetIndex = cart.indexWhere((waste) => waste["id"] == id);
    if (cart[targetIndex]["quantity"] > 1) {
      cart[targetIndex]["quantity"]--;
      saveToLocalStorage();
      print('Successfully: $cart');
    }
  }

  int totalQuantity() {
    double totalQuantity = 0;

    for (var i = 0; i < cart.length; i++) {
      totalQuantity += cart[i]["quantity"];
    }

    return totalQuantity.toInt();
  }

  double totalPayment() {
    double totalPayment = 0;

    for (var i = 0; i < cart.length; i++) {
      totalPayment += (double.parse(cart[i]["price"]) * cart[i]["quantity"]);
    }

    return totalPayment;
  }
}
