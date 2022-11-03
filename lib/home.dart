import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'assign_role.dart';
import 'constants.dart';
import 'create_center.dart';
import 'create_program.dart';
import 'create_user.dart';
import 'main.dart';
class home extends StatefulWidget {
  const home({Key key}) : super(key: key);
  @override
  State<home> createState() => _home();
}

class _home extends State<home> with   TickerProviderStateMixin  {
  Animation<double> _animation;
  AnimationController _animationController;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260));
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         const Divider(height:35),
         Align(alignment: Alignment.centerRight,child: IconButton(onPressed:()async{
           if(p != null){await  v.logOut();}
           else if( x !=null)
           {await GoogleSignIn().signOut();}
           await fa.signOut();
           Get.off(()=>const MyHomePage());
         }, icon: const Icon(Icons.logout)))
        , Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Welcome, ${fa.currentUser.displayName}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          Container(height:(MediaQuery.of(context).size.height/10)+5 ,width:  (MediaQuery.of(context).size.width/10)+30
              ,decoration: BoxDecoration(color:Colors.redAccent ,borderRadius: BorderRadius.circular(50), image: DecorationImage(image:fa.currentUser.photoURL==null?h:NetworkImage(fa.currentUser.photoURL) ,fit: BoxFit.fill)  )) ]    ) ,
         Divider(height:MediaQuery.of(context).size.height/25),
      Expanded(child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children:home1.map((e){
        return Container(
          margin:const EdgeInsets.all(10),
            decoration: BoxDecoration(
            color: home3.elementAt(home1.indexOf(e)),
            shape:   BoxShape.rectangle,borderRadius:BorderRadius.circular(10)
            ), child:Column(
                mainAxisAlignment:MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.center
                ,children: [
          Image.asset(home2.elementAt(home1.indexOf(e)),height: MediaQuery.of(context).size.height/10,),
              Text(e,style: const TextStyle(fontSize: 25,color: Colors.white),textAlign: TextAlign.justify),
            ]   )  );
      }).toList()))
       ]),
     floatingActionButton:FloatingActionBubble(
       // Menu items
       items: <Bubble>[
         Bubble(
           title:"Add user",
           bubbleColor :Colors.black,
           titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
           onPress: () {
             _animationController.reverse();
             Get.to(()=>const create_user());
           }, icon: null,
           iconColor: null
         ), Bubble(
           title:"Add center",
           bubbleColor :Colors.black,
           titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
           onPress: () {
             _animationController.reverse();
             Get.to(()=>const create_center());
           }, icon: null,
             iconColor: null
         ), Bubble(
           title:"Add program",
           bubbleColor :Colors.black,
           titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
           onPress: () {
             _animationController.reverse();
             Get.to(()=>const create_program());
           },icon: null,
             iconColor: null
         ),
         Bubble(
           title:"Assign role",
           bubbleColor :Colors.black,
           titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
           onPress: () {
             _animationController.reverse();
             Get.to(()=>const assign_role());
           },icon: null,
             iconColor: null )
       ],
       animation: _animation,
       onPress: () => _animationController.isCompleted
           ? _animationController.reverse()
           : _animationController.forward(),
       iconColor: Colors.white,
       iconData: Icons.add,
       backGroundColor: Colors.blue.shade700,
     )
   );
  }
}