import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Deneme/pages/loginpage.dart';
import 'package:Deneme/pages/navigationbar.dart';
import 'package:Deneme/pages/signuppage.dart';

import '../models/reusables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController isim=TextEditingController();
final TextEditingController soyisim=TextEditingController();
final TextEditingController eposta=TextEditingController();
final TextEditingController parola=TextEditingController();
final TextEditingController kullaniciadi=TextEditingController();
final TextEditingController resimadi=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Container(
          width: MediaQuery.of(context).size.width,
          
           decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
          MyColor("F1EEDB"),
          MyColor("8D7688"),
           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
               Image.asset('asssets/logo3.png',height:200,width: 200,alignment: Alignment.center,),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('GİRİŞ YAPIN'),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(400, 50)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return MyColor("725368");
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage(
                           eposta: eposta,
                           ad: isim,
                           parola: parola,
                           soyisim: soyisim,
                           kullaniciadi:kullaniciadi ,
                           resimadi:resimadi ,
                        )));
                  },
                  child: Text('KAYDOLUN'),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(400, 50)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return MyColor("725368");
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => (MyNavigationBar()))));
                  },
                  child: Text('ANONİM OLARAK GİRİŞ'),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(400, 50)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return MyColor("725368");
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                )
              ],
            ),
          ));

  }
}
