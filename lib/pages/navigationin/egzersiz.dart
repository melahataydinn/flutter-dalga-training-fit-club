import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Deneme/models/addmodel.dart';
import 'package:Deneme/models/exmodel.dart';
import 'package:Deneme/models/reusables.dart';
import 'package:Deneme/models/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class View extends StatefulWidget {
    const View({super.key});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (_) => ViewModel(),  
      builder: (context, child) => Scaffold( 
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text('Egzersiz LİSTESİ'),
        backgroundColor: MyColor("5B4342"),
        ),
        body: Center(
          child: Column(children: [
            StreamBuilder<List<ExModel>>(
              stream: Provider.of<ViewModel>(context, listen: false)
                  .getExList(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  print(asyncSnapshot.error);
                  return Center(
                      child:
                          Text('Bir Hata Oluştu, daha sonra tekrar deneyiniz'));
                          
                } else {
                  if (!asyncSnapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    List<ExModel> exList = asyncSnapshot.data!;
                    return BuildListView(list: exList, ekle: [],); //, key: null,
                  }
                }
              },
            ),
            Divider(),
          ]),
        ),
      
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    super.key,
    required this.list,
    required this.ekle
  });

  final List<ExModel> list;
final List<AddModel> ekle;
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  late List<ExModel> filteredList;
  final _formKey = GlobalKey<FormState>();
  get value => null;
  
  @override
  Widget build(BuildContext context) {
   
        String data;
    var fullList = widget.list;
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right:8.0,left: 8),
            child: TextField(
              decoration: InputDecoration( 
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Arama: Egzersizler',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0))),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;
                  setState(() {
                    filteredList = fullList
                        .where((ex) => ex.exname
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                        
                  });
                } else {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: isFiltering ? filteredList.length : fullList.length,
                itemBuilder: (context, index) {
                  var alist = isFiltering ? filteredList : fullList;
                
                  return Slidable(
                    // ignore: sort_child_properties_last
                    child: Card(
                       child: ListTile(
                          tileColor: MyColor("D9B4A3"),
                        title: Text(alist[index].exname),
                         onTap: () {
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              content: Image.memory(base64Decode(alist[index].resimadi))
                            );
                          }); }), ),
                   startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context)  async{    
                          var egz=ExModel(exname:alist[index].exname , resimadi: alist[index].resimadi).toMap();
                          await FirebaseFirestore.instance.collection("gunlukegzersiz").add(egz);   setState(() { });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.add,
                          label: 'Ekle',
                        ),],), );}  ),), ], ) ,) ;}}
