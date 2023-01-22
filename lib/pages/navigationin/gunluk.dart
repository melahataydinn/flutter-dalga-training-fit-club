import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Deneme/models/exmodel.dart';
import 'package:Deneme/models/reusables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool? tik=false;
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor("5A142A"),
          title: Text('Günlük Egzersizlerin'),
       
        ),
        body: Container(
           decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
               MyColor("F1EEDB"),
               MyColor("D9B4A3"),
           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("gunlukegzersiz")
                        .snapshots(includeMetadataChanges: true),
                    builder: ((context, snapshot) => snapshot.hasError
                        ? Text("Error")
                        : snapshot.connectionState == ConnectionState.waiting
                            ? Center(child: CircularProgressIndicator())
                            : ListView(
                              shrinkWrap: true,
                                children: snapshot.data!.docs.map((document) {
                                  var data = ExModel.fromJson(document.data());
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: MyColor("D5ADA6"),
                                      child: ListTile(
                                       
                                        title: Text(" ${data.exname}"),
                                        subtitle: Row(children: [
                                         
                                        ],),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                    child: SingleChildScrollView(
                                                        child: Column(
                                                      children: [
                                                        
                                                        ListTile(
                                                          title: Text("Delete"),
                                                          onTap: () async {
                                                            Navigator.pop(context);
                                                            await FirebaseFirestore.instance
                                                                .collection("gunlukegzersiz")
                                                                .doc(document.id)
                                                                .delete();
                                                          },
                                                        )
                                                      ],
                                                    )),
                                                  ));
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}