class OrderModel {
  int? quantity;
  String? updatedAt;
  String? createdAt;
  String? id;
  User? user;
  int? totalPayment;
  String? status;
  List<Products>? products;

  OrderModel(
      {this.quantity,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.user,
      this.totalPayment,
      this.status,
      this.products});

  OrderModel.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    totalPayment = json['total_payment'];
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['total_payment'] = totalPayment;
    data['status'] = status;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? name;
  String? photo;
  String? phoneNumber;
  String? id;
  String? email;

  User({this.name, this.photo, this.phoneNumber, this.id, this.email});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    phoneNumber = json['phone_number'];
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['photo'] = photo;
    data['phone_number'] = phoneNumber;
    data['id'] = id;
    data['email'] = email;
    return data;
  }
}

class Products {
  String? photoUrl;
  int? quantity;
  int? price;
  String? name;
  String? id;
  String? type;

  Products(
      {this.photoUrl,
      this.quantity,
      this.price,
      this.name,
      this.id,
      this.type});

  Products.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    quantity = json['quantity'];
    price = json['price'];
    name = json['name'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photoUrl'] = photoUrl;
    data['quantity'] = quantity;
    data['price'] = price;
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
