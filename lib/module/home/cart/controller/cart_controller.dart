import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:warung_nikmat/core.dart';

class CartController extends State<CartView> implements MvcController {
  static late CartController instance;
  late CartView view;

  bool isAdmin = false;
  double yourpoint = 0.0;
  double totalPayment = 0.0;
  String paymentMethod = '';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void getPoint(double pointNow) {
    yourpoint = pointNow;
    double getPoint =
        (CartService().totalPayment() * 0.1); // 10% dari total price
    if (yourpoint > getPoint) {
      yourpoint = getPoint;
    }
    totalPayment = CartService().totalPayment() - yourpoint;
  }

  void orderNow() {
    if (CartService().totalQuantity() == 0) {
      Get.back();
      showAlert("Oppsss", "Tidak ada menu yang dipesan");
    } else {
      showConfirmation(
        onPressed: () async {
          showLoading();
          String id = const Uuid().v4();
          try {
            Map<String, dynamic> history = {
              'id': id,
              "quantity": CartService().totalQuantity(),
              "payment_method": paymentMethod,
              "total_price": CartService().totalPayment(),
              "point_used": yourpoint,
              "total_payment": CartService().totalPayment() - yourpoint,
              "status": "Dalam Proses",
              "products": CartService().cart,
              "user": isAdmin ? "" : UserService.getUserData()
            };

            await OrderService().addOrder(
              id: id,
              quantity: CartService().totalQuantity(),
              paymentMethod: paymentMethod,
              totalPrice: CartService().totalPayment(),
              pointUsed: yourpoint,
              totalPayment: CartService().totalPayment() - yourpoint,
              status: "Dalam Proses",
              products: CartService().cart,
              user: isAdmin
                  ? {
                      "name": "Kasir",
                      "photo":
                          "https://user-images.githubusercontent.com/74108522/211291287-dcab15fe-6f08-41fc-b62b-0eb585c19008.png"
                    }
                  : UserService.getUserData(),
            );

            if (!isAdmin) {
              await PointService.addPoint(
                point: -yourpoint,
                userData: UserService.getUserData(),
              );
            }

            CartService().emptyCart();
            print("cart now ${CartService().cart}");

            Get.back();
            if (!isAdmin) {
              MainNavigationController.instance.setState(() {});
              Get.put(OrderDetailView(history));
            } else {
              Get.put(OrderDetailView(history, isPosAdmin: true));
            }
            showSuccess();
          } catch (e) {
            showAlert("Error", e.toString());
          }
        },
        color: cardColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
