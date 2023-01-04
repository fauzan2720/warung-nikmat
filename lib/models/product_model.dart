class ProductModel {
  String? id;
  String? name;
  int? price;
  String? type;
  String? photoUrl;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.type,
      this.photoUrl,
      this.createdAt,
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    type = json['type'];
    photoUrl = json['photoUrl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['type'] = type;
    data['photoUrl'] = photoUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
