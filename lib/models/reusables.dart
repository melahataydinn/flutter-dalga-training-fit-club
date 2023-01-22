import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


MyColor(String colorh){
  colorh=colorh.toUpperCase().replaceAll("#", "");
  if (colorh.length==6) {
  colorh="FF"+colorh;  
  }
  return Color(int.parse(colorh,radix: 16));
}

Container signinupbutton(BuildContext context,bool islogin,Function ontap){
return Container(
  width:MediaQuery.of(context).size.width ,
  height: 50,
  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
  child: ElevatedButton(
    onPressed: (() {
      ontap();
    }),child: Text(
      islogin ? 'Giriş Yap': 'Kayıt Ol', 
      style:TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 16
      ) ,
    ),
    
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states){
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return Colors.white;
      }),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))
    ),
    ),
);
} 
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.amber,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);


TextFormField reusable(String text,IconData icon, bool ispasswordtype, TextEditingController controller){
return TextFormField(
controller: controller,
obscureText: ispasswordtype,
enableSuggestions: ispasswordtype,
cursorColor: Colors.white,
style: TextStyle(color: Colors.white.withOpacity(0.9)),
decoration: InputDecoration(
  prefixIcon: Icon(
    icon,
    color: Colors.white70,
  ),
  labelText: text,
  labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,//textfieldın içindeki yazı boş olduğu sürece nher zaman gözükücek
  fillColor: Colors.white.withOpacity(0.3),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(width: 0, style: BorderStyle.none)
  ),

),
keyboardType: ispasswordtype ? TextInputType.visiblePassword:TextInputType.emailAddress,
);
}

Image logo(String imagename){
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 50,
    height: 50,
  );
}

Card reusablecard(BuildContext context, String resim,Widget widgt,String butonismi){
  return Card(
    child: Column(
      children: [
        Image.asset(resim,height: 50,width: 50,),
         ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>widgt));
                }, child: Text(butonismi))
      ],
    ),
  );
           
}
final FirebaseAuth _of=FirebaseAuth.instance;
final FirebaseFirestore veritabani=FirebaseFirestore.instance;
Stream<QuerySnapshot> getdata() {
  var ref=veritabani.collection('egzersizler').snapshots();

  return ref;
}
Stream<QuerySnapshot> getdatafromgunluk(){
  var ref=veritabani.collection("gunlukegzersiz").snapshots();
  return ref;
}
Stream<QuerySnapshot> getdatafromyemek(){
  var ref=veritabani.collection("yemekler").snapshots();
  return ref;
}
Stream<QuerySnapshot> getdatafromuser(){
  var ref=veritabani.collection("users").snapshots();
  return ref;
}


Future resdialog(BuildContext context,String resim) async{

 return showDialog(context: context, builder: (BuildContext context) {
   return AlertDialog(
    content: Image.memory(base64Decode(resim)),
   );
 });
}

     Future dialog(BuildContext context,String z,String yazi,String resimadi) 
            { return showDialog(context: context, builder: ((context) {
               return AlertDialog(
                content: Text("${z}"),
                title: Text(yazi),
                //icon:Image.asset("asssets/$resimadi") ,
                );
             }));
             }
             
             
             Future<void> addUser(String exname,String resimadi) {
      
      CollectionReference users = FirebaseFirestore.instance.collection('users').where("dlag").get() as CollectionReference<Object?>;

      return users.add({
            'exname': exname, // John Doe
            'resimadi': resimadi, // Stokes and Sons
          
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


