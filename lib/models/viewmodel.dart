import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Deneme/models/exmodel.dart';
import '../services/database.dart';
import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  String _collectionPath = 'egzersizler';

  Database _database = Database();
  
  Stream<List<ExModel>> getExList() {

    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getExlistFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    Stream<List<ExModel>> streamListEx = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => ExModel.fromMap(docSnap.data()))
            .toList());

    return streamListEx;
  }

  Future<void> delete(ExModel ex) async {
    await _database.deleteDocument(referecePath: _collectionPath, id: ex.exname);
  }
}
