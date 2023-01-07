import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:warung_nikmat/models/product_model.dart';

class ProductService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<ProductModel>> getProducts({required String type}) {
    try {
      return firestore
          .collection('products')
          .where('type', isEqualTo: type)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<ProductModel>((DocumentSnapshot message) {
          // print(message.data());
          return ProductModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (ProductModel b, ProductModel a) =>
              a.updatedAt!.compareTo(b.updatedAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addProduct({
    required String name,
    required int price,
    required String type,
    required String photoUrl,
  }) async {
    String id = const Uuid().v4();
    try {
      firestore.collection('products').doc(id).set({
        'id': id,
        'name': name,
        'price': price,
        'type': type,
        'photoUrl': photoUrl,
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString(),
      }, SetOptions(merge: true)).then(
          (value) => print('Data berhasil disimpan'));
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }

  Future<void> editProduct({
    required String id,
    required String name,
    required int price,
    required String type,
    required String photoUrl,
  }) async {
    try {
      firestore.collection('products').doc(id).set({
        'name': name,
        'price': price,
        'type': type,
        'photoUrl': photoUrl,
        'updated_at': DateTime.now().toString(),
      }, SetOptions(merge: true)).then(
          (value) => print('Data berhasil disimpan'));
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }

  Future<void> deleteProduct({
    required String id,
  }) async {
    try {
      firestore
          .collection('products')
          .doc(id)
          .delete()
          .then((value) => print('Data berhasil disimpan'));
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }
}
