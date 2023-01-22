import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Deneme/models/exmodel.dart';
import 'package:Deneme/models/reusables.dart';
import 'package:Deneme/models/yemekmodel.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const Three());
}

class Three extends StatefulWidget {
  const Three({Key? key}) : super(key: key);

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  double sonuc =1;

 TextEditingController ad=TextEditingController();
  TextEditingController kalori=TextEditingController();
List liste  =[];
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
        appBar:AppBar(backgroundColor: MyColor("361E40"),),
        body: Container(
           decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
          MyColor("F1EEDB"),
          MyColor("D9B4A3"),
           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
         child: Column(children: [
          SizedBox(height: 10,),
          SizedBox(
            width: 500,
            child: TextField(
              controller: ad,
              decoration: InputDecoration(
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                icon: Icon(Icons.food_bank_outlined)
              ),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 500,
            child: TextField(
              controller: kalori,
              decoration: InputDecoration(
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                icon: Icon(Icons.food_bank)
              ),),
          ),
          SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
             String b= kalori.text;
             int a=int.parse(b);
              var yemek=yemekModel(yemekadi: ad.text, kalori: int.parse(b)).toMap();
              FirebaseFirestore.instance.collection("yemekler").add(yemek);
              liste.add(a);
              for (var i = 0; i < liste.length; i++) {
                
                sonuc=sonuc+liste[i];
                setState(() {
                  
                });
              }
              GetIt.I.registerSingleton(sonuc);
            }, child: Text('Ekle')),
             Text("Aldığın kalori: $sonuc",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40
             ),
             ),
             
            SizedBox(
              height: 400,
              child: StreamBuilder(
                stream: getdatafromyemek(),
                builder:  ((context, snapshot) => snapshot.hasError
                    ? Text("Error")
                    : snapshot.connectionState == ConnectionState.waiting
                        ? CircularProgressIndicator()
                        : SizedBox(
                          height: 200,
                          child: ListView(
                            children: snapshot.data!.docs.map((e) {
                                var data = yemekModel.fromJson(e.data());
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: MyColor("D5ADA6"),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                      child: ListTile(
                                        leading: Icon(Icons.food_bank_outlined),
                                        title: Text(" Yemek: ${data.yemekadi}",
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                        subtitle: Text("Kalorisi: ${data.kalori}"),
                                        
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
                                                                .collection("yemekler")
                                                                .doc(e.id)
                                                                .delete();
                                                          },
                                                        )
                                                      ],
                                                    )),
                                                  ));
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                                ),
                        )
                              )),
            ),
                           
                            
                                      
                            ]
                            )
                            ));}}
         