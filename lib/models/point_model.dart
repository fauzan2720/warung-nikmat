class PointModel {
  String? point;
  String? createdAt;

  PointModel({this.point, this.createdAt});

  PointModel.fromJson(Map<String, dynamic> json) {
    point = json['point'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['point'] = point;
    data['created_at'] = createdAt;
    return data;
  }
}
