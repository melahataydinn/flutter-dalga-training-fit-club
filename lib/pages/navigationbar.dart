
import 'package:flutter/material.dart';
import 'package:Deneme/pages/navigationin/gunluk.dart';
import 'package:Deneme/pages/navigationin/indeks.dart';
import 'package:Deneme/pages/navigationin/egzersiz.dart';
import 'package:Deneme/pages/navigationin/yemek.dart';

import '../models/reusables.dart';  
  
void main() => runApp(MyApp());  
  
/// This Widget is the main application widget.  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: MyNavigationBar (),  
    );  
  }  
}  

class MyNavigationBar extends StatefulWidget {  
  //MyNavigationBar ({Key key}) : super(key: key);  

  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  

class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[ 
     View(),
     HomePage(),
      Three() ,
    Denemeee()
     ];
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items:  <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),  
            label: "", 
            backgroundColor: MyColor("5B4342")
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.align_vertical_center_sharp),  
            label: "", 
            backgroundColor:MyColor("5A142A")
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.food_bank_rounded),  
            label: "", 
            backgroundColor: MyColor("361E40"),  
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust_outlined),
          label: "",
          backgroundColor: MyColor("29102E")
          )
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}