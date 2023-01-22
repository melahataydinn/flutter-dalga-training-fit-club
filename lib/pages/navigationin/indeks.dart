import 'package:flutter/material.dart';
import 'package:Deneme/models/reusables.dart';
import 'package:get_it/get_it.dart';

class Denemeee extends StatefulWidget {
  const Denemeee({super.key});

  @override
  State<Denemeee> createState() => _DenemeState();
}

class _DenemeState extends State<Denemeee> {
  TextEditingController boy=TextEditingController();
  TextEditingController kilo=TextEditingController();
int val=1;
@override
void initState(){
  super.initState();
  val=0;
}   

  @override
  Widget build(BuildContext context) {

    double sonuccc=GetIt.I.get<double>();
   
  bool? tik=false;
    
    TextEditingController yas=TextEditingController();
    double toplam;
    return 
    Scaffold(
      appBar: AppBar(title: Text('Vücut'),backgroundColor: MyColor("#29102E"),),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
                 gradient: LinearGradient(colors: [
            MyColor("F1EEDB"),
            MyColor("D9B4A3"),
             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Vücut kitle indeksi",
              style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                height: 50,width: 100,
                child: TextField(
                  controller: boy,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                  
                    hintText: 'Boy',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    
                  ),
      
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                height: 50,width: 100,
                child: TextField(
                  controller: kilo,
                  decoration: InputDecoration(
                    hintText: 'Kilo',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                ),
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                
                onPressed: (){
               double x=double.parse(boy.text);
               double y=double.parse(kilo.text);
               double z=y/(x*x);
               if (z<18.5) {
                dialog(context, "${z}", "Zayıf", "sad.png" );
               }
               else if(18.5<=z &&z<=24.9){
                dialog(context, "$z", "İdeal", "ideal.png");
                 }
                  else if(25<=z &&z<=29.9){
                dialog(context, "$z", "idealin Üstü", "idalinüstü.png");
                 }
                  else if(30<=z &&z<=39.9){
                dialog(context, "$z", "Obez", "obez.png");
                 }
                else if(40<=z ){
                dialog(context, "$z", "Morbid Obez", "mobez.png");
                 }             
              }, child: Text('Hesapla'))
            ],),
          SizedBox(height: 100,),
             Text("Alınan Kalori: $sonuccc",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
             ),
             
             ),
             
             SizedBox(height: 100,),
            Card(
              elevation: 5,
              color: MyColor("C19A92"),
              child: Column(children: [
                Text("Günlük Alınması Gereken Kalori",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Kadın"),
                        Radio(value: 1, groupValue: val, onChanged: (value) {
                       setState(() {
                        val=value!;
                      });
                    }),
                     Text("Erkek"),
                           Radio(value: 2, groupValue: val, onChanged: (value) {
                            setState(() {
                              val=value!;
                            });
                      }),
                      ],
                    ),  
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(
                      height: 100,width: 150,
                       child: TextField(
                        controller: yas,
                        decoration: InputDecoration(
                          hintText: "Yaşınızı giriniz",
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(4)) ), ),
                     ),
                        SizedBox(width: 10,),
                      SizedBox(
                  height: 100,width: 150,
                   child: TextField(
                    controller: kilo,
                    decoration: InputDecoration(
                      hintText: "Kilonuzu giriniz",
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(4)) ), ),
                 ),
                  SizedBox(width: 10,),
                 SizedBox(
                  height: 100,width: 150,
                   child: TextField(
                    controller: boy,
                    decoration: InputDecoration(
                      hintText: "Boyunuzu giriniz",
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(4)) ), ),
                 ),
                   ],
                 ),
                
                    ElevatedButton(
                       style: ButtonStyle(
                     
                ),
                      onPressed: (){
                      String yass=yas.text;
                      String kiloo=kilo.text;
                      String boyy=boy.text;
                      if (val==1) {
                         toplam=655+9.6*int.parse(kiloo)+1.8*int.parse(boyy)-4.7*int.parse(yass);
                        
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            content: Text("$toplam"),
                          );
                        },);
                        
                      }
                      else{
                         toplam=66+13.7*int.parse(kiloo)+5*int.parse(boyy)-6.8*int.parse(yass);
                         
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            content: Text("$toplam"),
                          );
                        },);
                      }
                        GetIt.I.registerSingleton<double>(toplam);
                       
                    }, child: Text("Hesapla")),
                    SizedBox(height: 20,),
                    
                 
              ],),
            ),
            
            
          ],),
        
        ),
        
      ),
 
    
      );
  }
}