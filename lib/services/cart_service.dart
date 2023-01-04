import '/core.dart';

class CartService {
  List cart = mainStorage.get("cart") ?? [];

  saveToLocalStorage() async {
    await mainStorage.put("cart", cart);
  }

  getCart() async {
    cart = await mainStorage.get("cart") ?? [];
  }

  addCart({
    required String id,
    required String name,
    required double weight,
    required int point,
    required String photoUrl,
  }) {
    cart.add({
      "id": id,
      "_name": name,
      "weight": weight,
      "point": point,
      "photo_url": photoUrl,
    });
    saveToLocalStorage();
  }

  updateCart({
    required String id,
    required String name,
    required double weight,
    required int point,
    required String photoUrl,
  }) {
    // var targetIndex = cart.indexWhere(() => ["id"] == id);
    // cart[targetIndex] = {
    //   "id": id,
    //   "_name": name,
    //   "weight": weight,
    //   "point": point,
    //   "photo_url": photoUrl,
    // };
    saveToLocalStorage();
  }

  deleteCart({
    required String id,
  }) {
    // cart.removeWhere(() => ["id"] == id);
    saveToLocalStorage();
  }

  // is(Model product) {
  //   if (Cart
  //           .indexWhere((element) => element["photo_url"] == product.photoUrl) >
  //       -1) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  addWeight(Map<dynamic, dynamic> item) {
    {
      item["weight"] += 1 / 4;
      item["point"] = 250 * item["weight"];

      CartService().saveToLocalStorage();
    }
  }

  reduceWeight(Map<dynamic, dynamic> item) async {
    item["weight"] -= 1 / 4;
    item["point"] = 250 * item["weight"];

    CartService().saveToLocalStorage();
  }

  double totalWeight() {
    double totalWeight = 0;

    for (var i = 0; i < cart.length; i++) {
      totalWeight += cart[i]["weight"];
    }

    return totalWeight;
  }

  double totalPoint() {
    double totalPoint = 0;

    for (var i = 0; i < cart.length; i++) {
      totalPoint += cart[i]["point"];
    }

    return totalPoint;
  }
}
