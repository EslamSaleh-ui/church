import 'dart:math';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'constants.dart';

class assign_role extends StatefulWidget {
  const assign_role({Key key}) : super(key: key);

  @override
  State<assign_role> createState() => _assign_role();
}

class _assign_role extends State<assign_role> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return   Scaffold(
        body: Form(key: k3,child:
        SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Divider(height: MediaQuery.of(context).size.height/28),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [const Text('Assign Role',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
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
                 ,Padding(padding: const EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 5),child:TextFormField(
                      controller: tc1,
                      keyboardType: TextInputType.number,
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';
                        }
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'select role',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )) ,Padding(padding: const EdgeInsets.all( 5),child:TextFormField(
                      controller: tc4,
                      keyboardType: TextInputType.emailAddress,
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';
                        } else if(f.length<6) {
                          return 'This must be more than 20 chars';
                        }
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'Enter full name',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )),Padding(padding: const EdgeInsets.all(5),child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child:
                        TextFormField(
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
                            decoration: InputDecoration(hintText :'Email',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),    const SizedBox(width: 20.0),
                        Flexible(child:
                        TextFormField(
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
                            decoration: InputDecoration(hintText :'Phone number',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )) ]  )),
                  Padding(padding: const EdgeInsets.all(5),child:TextFormField(
                      controller: tc8,
                      keyboardType: TextInputType.text,
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';
                        } else if(f.length<20) {
                          return "must be at least 20 chars";
                        }
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'Address',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )),Padding(padding: const EdgeInsets.all(5),child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child:
                        TextFormField(
                            controller: tc10,
                            keyboardType: TextInputType.streetAddress,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Church location',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),    const SizedBox(width: 20.0),
                        Flexible(child:
                        TextFormField(
                            controller: tc11,
                            keyboardType: TextInputType.streetAddress,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';}
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'sub location',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )) ]  )),
                  Padding(padding: const EdgeInsets.all(5),child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child:
                        TextFormField(
                            controller: tc12,
                            keyboardType: TextInputType.text,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Center',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),    const SizedBox(width: 20.0),
                        Flexible(child:
                        TextFormField(
                            controller: tc13,
                            keyboardType: TextInputType.text,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Category',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )) ]  )),
                  Padding(padding: const EdgeInsets.all(5),child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child:
                        TextFormField(
                            controller: tc14,
                            keyboardType: TextInputType.text,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Sub category',
                                filled: true,isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),    const SizedBox(width: 20.0),
                        Flexible(child:
                        TextFormField(
                            controller: tc15,
                            keyboardType: TextInputType.number,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Church Group',
                                filled: true,isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )) ]  )),
                  Padding(padding: const EdgeInsets.only(top:10,right: 5,left:5,bottom:10),child:TextFormField(
                      controller: tc9,
                      keyboardType: TextInputType.number,
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';}
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'Occupation',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )),Padding(padding: const EdgeInsets.all(5),child:TextFormField(
                      controller: tc2,
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
                      decoration: InputDecoration(hintText :'password',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )), const Divider(height: 5), ElevatedButton(onPressed: () async {
                    if(  k3.currentState.validate() )
                    {
                      if(path_1 !=null){
                        f.value=await url('roles',path_1, Random(1000000).nextDouble().toString());
                      }
                      try{
                        await ff.collection('/roles').add({
                          "creator":fa.currentUser.uid,
                          "select_role":tc1.text,
                          "password":tc2.text,
                          "name":tc4.text,
                          "email":tc5.text,
                          "phone":tc6.text,
                          "address":tc8.text,
                          "location":tc10.text,
                          "sub_location":tc11.text,
                          "center":tc12.text,
                          "category":tc13.text,
                          "sub_category":tc14.text,
                          "church_group":tc15.text,
                          "occupation":tc9.text,
                          "image":f });
                        tc4.clear();tc5.clear();tc6.clear();tc8.clear();tc10.clear();tc11.clear();
                        tc12.clear();tc13.clear();tc14.clear();tc15.clear();tc9.clear();tc1.clear();
                        tc2.clear();path_1=null;h=const AssetImage('asset/user.jpg'); setState((){});
                        f.value='';
                        Toast.show('user created',gravity: Toast.bottom,duration: Toast.lengthLong);
                        Get.back();
                      }
                      on FirebaseException catch(e){
                        Toast.show(e.message,gravity: Toast.bottom,duration: Toast.lengthLong);}
                    }
                  } ,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade400 ,
                        onPrimary: Colors.white, shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                        minimumSize: Size(MediaQuery.of(context).size.width-50 ,60), //////// HERE
                      ),
                      child: const Text('Update',style: TextStyle(fontWeight: FontWeight.bold)   ))
                ]))
        ));
  }
}