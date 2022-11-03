import 'dart:math';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'constants.dart';

class create_program extends StatefulWidget {
  const create_program({Key key}) : super(key: key);

  @override
  State<create_program> createState() => _create_program();
}

class _create_program extends State<create_program> {
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
                  const  Align(alignment: Alignment.centerLeft,child:
              Text('  Create program',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))   )
                  ,Padding(padding: const EdgeInsets.only(top: 40,left: 5,right: 5,bottom: 5),child:TextFormField(
                      controller: tc4,
                      onTap: (){ DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1950, 3, 5),
                          maxTime: DateTime(2050, 6, 7), onConfirm: (date) {
                        tc4.text='${date.year}/${date.month}/${date.day}';
                          }, currentTime: DateTime.now(), locale: LocaleType.en);},
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';
                        }
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'date',
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
                            onTap: (){
                              DatePicker.showTimePicker(context,onConfirm: (time){
                                tc5.text='${time.hour}:${time.minute}';
                              });
                            },
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'opening prayer',
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
                            onTap: (){
                              DatePicker.showTimePicker(context,onConfirm: (time){
                                tc6.text='${time.hour}:${time.minute}';
                              }); },
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Bible reading',
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
                      onTap: (){
                        DatePicker.showTimePicker(context,onConfirm: (time){
                          tc8.text='${time.hour}:${time.minute}';
                        });
                      },
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';
                        }
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'preaching',
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
                        TextFormField(
                            controller: tc10,
                            onTap: (){
                              DatePicker.showTimePicker(context,onConfirm: (time){
                                tc10.text='${time.hour}:${time.minute}';
                              });
                            },
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'prayer session',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),
                  Padding(padding: const EdgeInsets.all(5),child:
                        TextFormField(
                            controller: tc11,
                            onTap: (){
                              DatePicker.showTimePicker(context,onConfirm: (time){
                                tc11.text='${time.hour}:${time.minute}';
                              });
                            },
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';}
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'offering',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )) ,
                  Padding(padding: const EdgeInsets.all(5),child:
                        TextFormField(
                            controller: tc12,
                           onTap: (){ DatePicker.showTimePicker(context,onConfirm: (time){
                             tc12.text='${time.hour}:${time.minute}';
                           });},
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Announcement',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),
                  const   Align(alignment: Alignment.centerLeft,child:Text('  Attendance',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)  )),
                  Padding(padding: const EdgeInsets.all(5),child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(child: TextFormField(
                            controller: tc13,
                            keyboardType: TextInputType.number,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Male',
                                filled: true,
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),
                        Flexible(child:
                        TextFormField(
                            controller: tc14,
                            keyboardType: TextInputType.number,
                            validator:(f){
                              if( f.isEmpty) {
                                return 'This Field is needed';
                              }
                              return null;
                            } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                            style:const TextStyle(fontSize: 25,color: Colors.black) ,
                            decoration: InputDecoration(hintText :'Female',
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
                            decoration: InputDecoration(hintText :'Youth',
                                filled: true,isCollapsed: true,
                                contentPadding: const EdgeInsets.all(9),
                                fillColor: Colors.grey.shade300,
                                hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                                enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                                , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                                ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                        )),
                      Flexible(child: TextFormField(
                          controller: tc1,
                          keyboardType: TextInputType.number,
                          validator:(f){
                            if( f.isEmpty) {
                              return 'This Field is needed';
                            }
                            return null;
                          } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                          style:const TextStyle(fontSize: 25,color: Colors.black) ,
                          decoration: InputDecoration(hintText :'Children',
                              filled: true,
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.all(9),
                              fillColor: Colors.grey.shade300,
                              hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                              enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                              , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                              ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                              ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                      ))
                      ]  )),
                  Padding(padding: const EdgeInsets.only(top:10,right: 5,left:5,bottom:10),child:TextFormField(
                      controller: tc9,
                      keyboardType: TextInputType.text,
                      validator:(f){
                        if( f.isEmpty) {
                          return 'This Field is needed';}
                        return null;
                      } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                      style:const TextStyle(fontSize: 25,color: Colors.black) ,
                      decoration: InputDecoration(hintText :'remarks',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(9),
                          fillColor: Colors.grey.shade300,
                          hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                          enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25))
                          , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                          ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 0.5,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                  )), const Divider(height: 38), ElevatedButton(onPressed: () async {
                    if(  k3.currentState.validate() )
                    {
                      try{
                        await ff.collection('/programs').add({
                          "creator":fa.currentUser.uid,
                          "date":tc4.text,
                          "opening_prayer":tc5.text,
                          "bible_reading":tc6.text,
                          "preaching":tc8.text,
                          "prayer session":tc10.text,
                          "offering":tc11.text,
                          "Announcement":tc12.text,
                          "male":tc13.text,
                          "female":tc14.text,
                          "youth":tc15.text,
                          "children":tc1.text,
                          "remarks":tc9.text,
                          });
                        tc4.clear();tc5.clear();tc6.clear();tc8.clear();tc10.clear();tc11.clear();
                        tc12.clear();tc13.clear();tc14.clear();tc15.clear();tc9.clear();tc1.clear();
                        Toast.show('program created',gravity: Toast.bottom,duration: Toast.lengthLong);
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
                      child: const Text('Create',style: TextStyle(fontWeight: FontWeight.bold)   ))
                ]))
        ));
  }
}