import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warung_nikmat/core.dart';

class PointService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<PointModel>> getHistories() {
    try {
      return firestore
          .collection('points')
          .where('point', isEqualTo: 100000)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<PointModel>((DocumentSnapshot message) {
          // print(message.data());
          return PointModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (PointModel b, PointModel a) => a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> addPoint({
    required double point,
    required Map userData,
  }) async {
    await FirebaseFirestore.instance.collection("points").add({
      "point": point,
      "user": userData,
      'created_at': DateTime.now().toString(),
    });

    await UserService.updatePoint(
      point: point,
    );

    return true;
  }
}
