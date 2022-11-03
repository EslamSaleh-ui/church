import 'dart:io';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'constants.dart';
import 'home.dart';
import 'main.dart';


class sing_up extends StatefulWidget {
  const sing_up({Key key}) : super(key: key);

  @override
  State<sing_up> createState() => _sing_up();
}

class _sing_up extends State<sing_up> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body:Form(key: k3,child:
      SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Divider(height: MediaQuery.of(context).size.height/25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [const Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
           GestureDetector(onTap: ()async{
             try{ final f=await ImagePicker().pickImage(source: ImageSource.gallery);
               final rul=await f.readAsBytes();
                h= MemoryImage(rul);
                path_1=f.path;
                setState((){});
             }
             on Exception catch(e)
             { Toast.show(e.toString(),gravity:Toast.center,duration:Toast.lengthLong);}
           }, child: Badge(position:BadgePosition.bottomEnd(),badgeColor: Colors.blue,shape: BadgeShape.circle,badgeContent: const Icon(Icons.add,color: Colors.white),
                  child:Container(height:(MediaQuery.of(context).size.height/10)+5 ,width:  (MediaQuery.of(context).size.width/10)+30
                ,decoration: BoxDecoration(color:Colors.redAccent ,borderRadius: BorderRadius.circular(50), image: DecorationImage(image:h ,fit: BoxFit.fill)  ))  ))    ])
     ,Padding(padding: const EdgeInsets.only(top: 30,left: 5,right: 5,bottom: 5),child:TextFormField(
                    controller: tc4,
                    keyboardType: TextInputType.emailAddress,
                    validator:(f){
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(f.length<6) {
                        return 'This must be more than 6 chars';
                      }
                      return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Enter your username',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                )),Padding(padding: const EdgeInsets.all(5),child:TextFormField(
                    controller: tc5,
                    keyboardType: TextInputType.emailAddress,
                    validator:(f){
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(!f.isEmail) {
                        return 'This must be email';
                      }
                      return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Enter your Email',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                )),
                Padding(padding: const EdgeInsets.all(5),child:TextFormField(
                    controller: tc6,
                    keyboardType: TextInputType.phone,
                    validator:(f){
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(!f.isPhoneNumber) {
                        return 'This must be Phone number';
                      }
                      return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Enter your Phone number',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                )),
                Padding(padding: const EdgeInsets.all(5),child:TextFormField(
                    controller: tc8,
                    keyboardType: TextInputType.text,
                    validator:(f){
                      String v= r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp S=RegExp(v);
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(!S.hasMatch(f)) {
                        return "Password must be at least 8 characters, include an uppercase letter, number and symbol";
                      }
                      return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Enter your password',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                )),
                Padding(padding: const EdgeInsets.only(top:10,right: 5,left:5,bottom:10),child:TextFormField(
                    controller: tc9,
                    keyboardType: TextInputType.text,
                    validator:(f){
                      String v= r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp S=RegExp(v);
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(!S.hasMatch(f)) {
                        return "Password must be at least 8 characters, include an uppercase letter, number and symbol";
                      } else if(tc8.text!=tc9.text) {
                        return 'Fields not identical';
                      } return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Retrieve your password',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                )),  ElevatedButton(onPressed: () async {  if(  k3.currentState.validate() )
                {try{
                  await fa.createUserWithEmailAndPassword(email: tc5.text, password: tc8.text);
                  await fa.currentUser.updateDisplayName(tc4.text);
                  await ff.collection('/users').add({
                    "id":fa.currentUser.uid,
                    "name":fa.currentUser.displayName,
                    "phone":tc6.text });
                 if(path_1 !=null){
                   String p=await url('users',path_1,fa.currentUser.uid);
                 await fa.currentUser.updatePhotoURL(p);}
                  Toast.show('user created',gravity: Toast.bottom,duration: Toast.lengthLong);
                  Get.off(()=>const home());
                }
                on FirebaseAuthException catch(e){
                  Toast.show(e.message,gravity: Toast.bottom,duration: Toast.lengthLong);}
                }} ,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade400 ,
                      onPrimary: Colors.white, shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                      minimumSize: Size(MediaQuery.of(context).size.width-50 ,60), //////// HERE
                    ),
                    child: const Text('Sign In')),
                TextButton(onPressed: (){Get.off(()=>const MyHomePage());}, child: const Text('If you already have account login here',style:TextStyle(color: Colors.black87)  ))
              ]))
      )   );
  }

}
