import '/core.dart';

class WishlistService {
  List wishlist = mainStorage.get("wishlist") ?? [];

  saveToLocalStorage() async {
    await mainStorage.put("wishlist", wishlist);
  }

  addProduct(ProductModel product) {
    if (!isWishlist(product)) {
      wishlist.add({
        "id": product.id,
        "name": product.name,
        "price": product.price,
        "type": product.type,
        "photoUrl": product.photoUrl,
      });
    } else {
      wishlist.removeWhere((element) => element["id"] == product.id);
    }

    saveToLocalStorage();
    print('Successfully: $wishlist');
  }

  isWishlist(ProductModel product) {
    if (wishlist.indexWhere((element) => element["id"] == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  removeWishlist(String id) {
    wishlist.removeWhere((element) => element["id"] == id);
    saveToLocalStorage();
    print('Successfully: $wishlist');
  }
}
