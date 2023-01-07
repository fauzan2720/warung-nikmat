import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class CartController extends State<CartView> implements MvcController {
  static late CartController instance;
  late CartView view;

  double yourpoint = 0.0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void orderNow() {
    if (CartService().totalQuantity() == 0) {
      Get.back();
      showAlert("Oppsss", "Tidak ada menu yang dipesan");
    } else if (CartService().totalPayment() <= yourpoint) {
      showConfirmation(
        onPressed: () async {
          showLoading();
          try {
            Map<String, dynamic> history = {
              "quantity": CartService().totalQuantity(),
              "total_payment": CartService().totalPayment(),
              "status": "Dalam Proses",
              "products": CartService().cart,
              "user": UserService.getUserData()
            };

            await OrderService().addOrder(
              quantity: CartService().totalQuantity(),
              totalPayment: CartService().totalPayment(),
              status: "Dalam Proses",
              products: CartService().cart,
              user: UserService.getUserData(),
            );

            await PointService.addPoint(
              point: -double.parse("${CartService().totalPayment()}"),
              userData: UserService.getUserData(),
            );

            CartService().emptyCart();
            print("cart now ${CartService().cart}");

            Get.back();
            MainNavigationController.instance.setState(() {});
            Get.put(OrderDetailView(history));
            showSuccess();
          } catch (e) {
            showAlert("Error", e.toString());
          }
        },
        color: cardColor,
      );
    } else {
      showAlert("Oppsss", "Point anda tidak mencukupi");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
