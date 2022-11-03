import 'dart:math';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'constants.dart';

class create_center extends StatefulWidget {
  const create_center({Key key}) : super(key: key);

  @override
  State<create_center> createState() => _create_center();
}

class _create_center extends State<create_center> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return   Scaffold(
        body: Form(key: k3,child:
        SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Divider(height: MediaQuery.of(context).size.height/25),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [const Text('Create User',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
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
                  ,Padding(padding: const EdgeInsets.only(top: 40,left: 5,right: 5,bottom: 5),child:TextFormField(
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
                  )),   Padding(padding: const EdgeInsets.all(5),child:
                        TextFormField(
                            controller: tc14,
                            keyboardType: TextInputType.phone,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }else if(!f.isPhoneNumber) {
                                return 'This must be Phone number';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Family contact number',
                                filled: true,isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),   Padding(padding: const EdgeInsets.all(5),child:
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
                        )),
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
                  )),const Divider(height: 50),  ElevatedButton(onPressed: () async {
                    if(  k3.currentState.validate() )
                    {
                      if(path_1 !=null){
                        await url('center',path_1, Random(1000000).nextDouble().toString()).then((value)
                        {f.value=value;});
                      }
                      try{
                        await ff.collection('/center').add({
                          "creator":fa.currentUser.uid,
                          "name":tc4.text,
                          "email":tc5.text,
                          "phone":tc6.text,
                          "address":tc8.text,
                          "family_contact_num":tc14.text,
                          "church_group":tc15.text,
                          "occupation":tc9.text,
                          "image":f.value });
                         tc4.text='';tc5.text='';tc6.text='';tc8.text='';tc14.text='';tc15.text='';tc9.text='';
                        path_1=null;h=const AssetImage('asset/user.jpg'); setState((){});f.value='';
                    Toast.show('center created',gravity: Toast.bottom,duration: Toast.lengthLong);
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
                      child: const Text('Create',style: TextStyle(fontWeight: FontWeight.bold)  ))
                ]))
        ));
  }
}