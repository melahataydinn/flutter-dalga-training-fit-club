import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Deneme/models/reusables.dart';
import 'package:Deneme/models/usermodel.dart';
import 'package:Deneme/pages/navigationbar.dart';
import 'package:Deneme/pages/signuppage.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override 
   TextEditingController username=TextEditingController();
   TextEditingController _password=TextEditingController();
   TextEditingController _email=TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
      //color: Colors.grey,
      decoration: BoxDecoration(
          
          gradient: LinearGradient(colors:
          [          MyColor("F1EEDB"),
          MyColor("8D7688"),
          ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
       // child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                reusable('Kullanıcı adınızı giriniz', Icons.person_outline, false, username),
                SizedBox(height: 30,),
                reusable('Şifrenizi giriniz', Icons.lock_outline, true, _password),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: ()async {
                       showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title:Text('Şifreni mi unuttun?') ,
                          content: Text('Sana yeni şifreni yollamamız için email adresini gir'),
                          actions: [
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: 'email'
                              ),
                            ),
                            ElevatedButton(onPressed: ()async{
                                  await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
                                  Navigator.pop(context);
                                  }, child: Text('resetle'))
                          ],
                        );
                       });
                      },
                      child: Text('Şifreni mi unuttun?')),
                  ],
                ),
                ),
                ElevatedButton(onPressed: ()async{
                  var response = await FirebaseFirestore.instance
                      .collection("users")
                      .where("username", isEqualTo: username.text)
                      .where("password", isEqualTo: _password.text)
                      .limit(1)
                      .get();
                  var giris= await FirebaseAuth.instance;
                  if (response.docs.isNotEmpty) {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyNavigationBar()));
                     FirebaseFirestore.instance.collection("users").doc(giris.currentUser!.uid).update({'admin': true});
                      setState(() {
                        
                      });
                  }
                  else{
                   showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Kullanıcı Bulunamadı!'),
                        content: Text('Kullanıcı adı veya şifrenizi girmeyi tekrar deneyin'),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('ok'))
                        ],
                      );
                   });
                  }
                },child: Text('Giriş yap'),
                ),
                SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Geri'))
          ]),
        ),   
      );
  }
}