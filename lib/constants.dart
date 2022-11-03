// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth fa=FirebaseAuth.instance;
FirebaseFirestore ff=FirebaseFirestore.instance;
GlobalKey<FormState> k1=GlobalKey();
GlobalKey<FormState> k2=GlobalKey();
GlobalKey<FormState> k3=GlobalKey();
final tc1=TextEditingController();
final tc2=TextEditingController();
final tc3=TextEditingController();
final tc4=TextEditingController();
final tc5=TextEditingController();
final tc6=TextEditingController();
final tc7=TextEditingController();
final tc8=TextEditingController();
final tc9=TextEditingController();
final tc10=TextEditingController();
final tc11=TextEditingController();
final tc12=TextEditingController();
final tc13=TextEditingController();
final tc14=TextEditingController();
final tc15=TextEditingController();
final tc16=TextEditingController();
FacebookLogin v= FacebookLogin();
GoogleSignInAccount x;
ImageProvider<Object> h=const AssetImage('asset/user.jpg');
List<String> home1=['Centers','Users', 'Programs','Attendance','Support','Leaders'];
List<String>  home2=['asset/churchs.jpg','asset/users.jpg','asset/date.png',
  'asset/attendance.png', 'asset/support.png', 'asset/leaders.jpg'];
List<Color>  home3=[HexColor("#c84809"),HexColor("#cb072b"),HexColor("#08c516"),
Colors.yellow.shade900,HexColor("#204b0b"),HexColor("#8110ff")];
var p,path_1;
final f=''.obs;
  Future<String> url(String folder,String path,String name)async{
    var storageReference = FirebaseStorage
        .instance
        .ref()
        .child('$folder/img_$name.jpg');
    File f = File(path);
    await  storageReference.putFile(f);
    return storageReference.getDownloadURL();
  }