import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Deneme/models/exmodel.dart';

import '../services/database.dart';
import 'package:flutter/material.dart';

class AddModel extends ChangeNotifier {
  Database _database = Database();
  String collectionPath = 'gunlukegzersiz';

  Future<void> add(
      {required String exname,
      required String resimadi,
      }) async {

    ExModel newday = ExModel(
        exname: exname,
        resimadi: resimadi
        );

    await _database.setExData(
        collectionPath: collectionPath, exAsMap: newday.toMap());
  }

   
  
}
