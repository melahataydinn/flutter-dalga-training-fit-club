import 'package:Deneme/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/reusables.dart';
import '../models/usermodel.dart';
enum Actions1 { signup, update }


class SignUpPage extends StatefulWidget {
     SignUpPage({super.key,
     required this.ad,
     required this.eposta,
     required this.parola,
     required this.soyisim,
     required this.kullaniciadi,
     required this.resimadi,
     this.action=Actions1.signup,  
     this.username="",
     });
final TextEditingController ad;
final TextEditingController soyisim;
final TextEditingController eposta;
final TextEditingController parola;
final TextEditingController kullaniciadi;
final TextEditingController resimadi;
final Actions1  action;
final String username;
  
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
               
  @override
  Widget build(BuildContext context) {
             
    return Scaffold(
      appBar: AppBar(title: Text('KAYIT')),
      body:   
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:
          [MyColor("F1EEDB"),
          MyColor("8D7688"),
          ],begin: Alignment.bottomCenter,end: Alignment.topCenter)
        ),
        child:Column(
          children: [
            SizedBox(height: 20,),
            reusable('isminizi giriniz',  (Icons.abc_rounded), false, widget.ad),
            SizedBox(height: 20,),
            reusable('soyadınızı giriniz', Icons.add_circle_outlined, false, widget.soyisim),
            SizedBox(height: 20,),
            reusable('Epostanızı giriniz', Icons.attach_email, false, widget.eposta),
            SizedBox(height: 20,),
            reusable('şifrenizi giriniz', Icons.password, true, widget.parola),
            SizedBox(height: 20,),
            reusable('kullanıcı adınızı giriniz', Icons.zoom_out_map_outlined, false, widget.kullaniciadi),
            SizedBox(height: 20,),
              
          ElevatedButton(onPressed: ()async{
            var user = UserModel(
                    name: widget.ad.text,
                    email: widget.eposta.text,
                    password: widget.parola.text,
                    username: widget.kullaniciadi.text,
                    lastname: widget.soyisim.text, 
                   );
               if (widget.ad.text=="" ||widget.soyisim.text=="" ||widget.eposta.text=="" ||widget.kullaniciadi.text=="" ||widget.parola.text=="" ) {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Text("Boş Bırakmayınız!"),
                );
              },);
            }
                else if (widget.action == Actions1.signup) {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .add(user.toJson());
                      showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  content: Text('Başarıyla kaydoldun!'),
                );
              });
            Navigator.push(
               context, MaterialPageRoute(builder: (context) => HomePage()));
                }    
                else {
                  var response = await FirebaseFirestore.instance
                      .collection("users")
                      .where("username", isEqualTo: widget.kullaniciadi)
                      .limit(1)
                      .get();
                  if (response.docs.isNotEmpty) {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(response.docs.first.id)
                        .set(user.toJson());
                  }
                }
          }, child: Text('Kaydol')),
        ],))
    );
  }
}