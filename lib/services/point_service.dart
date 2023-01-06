import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warung_nikmat/core.dart';

class PointService {
  static Future<bool> addPoint({
    required double point,
    required Map userData,
  }) async {
    await FirebaseFirestore.instance.collection("points").add({
      "point": point,
      "user": userData,
    });

    await UserService.updatePoint(
      point: point,
    );

    return true;
  }
}
