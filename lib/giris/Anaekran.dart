import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Deneme/pages/homepage.dart';
import 'package:Deneme/services/auth.dart';
import 'package:provider/provider.dart';





class Anaekran extends StatelessWidget {
  const Anaekran({super.key});
   

  @override
  Widget build(BuildContext context) {
  return Provider<Auth>(
    create:(context)=>Auth(),
    child: MaterialApp(
    
    title: 'uygulama',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
      
      ),
    home:HomePage(),
   
  )
  );}
}
  
  
 
