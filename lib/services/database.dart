import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Deneme/models/exmodel.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Firestore servisinden kitapların verisini stream olarak alıp sağlamak

  Stream<QuerySnapshot> getExlistFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

  /// Firestore üzerindeki bir veriyi silme hizmeti
  Future<void> deleteDocument(
      {required String referecePath, String? id}) async {
    await _firestore.collection(referecePath).doc(id).delete();
  }

  /// firestore'a yeni veri ekleme ve güncelleme hizmeti
  Future<void> setExData(
      {String? collectionPath, Map<String, dynamic>? exAsMap}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(ExModel.fromMap(exAsMap!).exname)
        .set(exAsMap);
  }
}
