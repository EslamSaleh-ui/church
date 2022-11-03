import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';
import 'home.dart';
import 'sign_up.dart';
import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(fa.currentUser !=null) {
    runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: home()   ));
  } else {
    runApp(const GetMaterialApp(
  debugShowCheckedModeBanner: false,
  home:   MyApp()
  ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor:   Colors.white
      ,body: SingleChildScrollView(child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [  Container(height:MediaQuery.of(context).size.height-250
        ,width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('asset/church.png',) )),),
                Column(children: const [Text('Welcome to TrueVine',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ))  ,
        Text('House Fellowship',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold)) ,
      Text('\nThis app is used to Administer and,Manage House\nFellowship Centers in the Mountain of fire and miracle\n ministry worldwide\n',textAlign: TextAlign.center)])
      ,Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Get.to(()=>const MyHomePage());} ,
              style: ElevatedButton.styleFrom(
                primary: Colors.cyanAccent.shade400 ,
                onPrimary: Colors.white, shape: const RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25) ,topLeft: Radius.circular(25))),
                minimumSize: Size(MediaQuery.of(context).size.width/3 ,75), //////// HERE
              ),
           child: const Text('Sign In'))
      ,    ElevatedButton(onPressed: (){Get.to(()=>const sing_up());} ,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade400 ,
          onPrimary: Colors.white, shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(25) ,topRight: Radius.circular(25))),
          minimumSize: Size(MediaQuery.of(context).size.width/3 ,75), //////// HERE
        ),
        child: const Text('Sign Up'))
            ])
          ]) )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final twitterLogin =new  TwitterLogin(
  //     consumerKey:  'UfOYKdPxqMyU4hRCErTMXTCmr',
  //     consumerSecret:  'kW0hOz8E4qX5uChCQstG2dhp4HRLK77np2fEYUGGB0bF59CanU');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: k1,
            child:SingleChildScrollView(
                child:  Column(
          children: <Widget>[
            const Divider(height: 50),
            const Align(widthFactor: 2.5,alignment: Alignment.centerLeft,child: Text('Welcome Back',
                style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)   )),
             Divider(height:MediaQuery.of(context).size.height/5),
            Padding(padding: const EdgeInsets.all(10),child:TextFormField(
              controller: tc1,
              keyboardType: TextInputType.emailAddress,
              validator:(f){
                  if( f.isEmpty) {
                    return 'This Field is needed';
                  } else if(!f.isEmail) {
                    return 'This is Not Email address';
                  }
                  return null;
              } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
              style:const TextStyle(fontSize: 25,color: Colors.black) ,
              decoration: InputDecoration(hintText :'Enter your email',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                  enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25))
                 , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
            ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                  ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
          )),
            Padding(padding: const EdgeInsets.all(10),child:  TextFormField(
                controller: tc2,
                keyboardType: TextInputType.text,
                validator:(f){
                  if( f.isEmpty) {
                    return 'This Field is needed';
                  }
                  return null;
                } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                style:const TextStyle(fontSize: 25,color: Colors.black) ,
                decoration: InputDecoration(hintText :'Enter your password',
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                    enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25) ),
                    focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                    ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                    ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
            )),Align(alignment: Alignment.centerRight,child:
          TextButton(onPressed: (){
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.noHeader,
              body: Form(
                key: k2,
                  child: Padding(padding: const EdgeInsets.all(10),child:TextFormField(
                    controller: tc3,
                    keyboardType: TextInputType.emailAddress,
                    validator:(f){
                      if( f.isEmpty) {
                        return 'This Field is needed';
                      } else if(!f.isEmail) {
                        return 'This is Not Email address';
                      }
                      return null;
                    } , autovalidateMode:AutovalidateMode.onUserInteraction  ,
                    style:const TextStyle(fontSize: 25,color: Colors.black) ,
                    decoration: InputDecoration(hintText :'Enter your email',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        hintStyle:const TextStyle(fontSize: 25,color: Colors.black) ,
                        enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25))
                        , focusedErrorBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,errorBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.red),borderRadius: BorderRadius.circular(25) )
                        ,focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.black),borderRadius: BorderRadius.circular(25) ))
                ))
              ),
              title: 'This is Ignored',
              desc:   'This is also Ignored',
              btnOkOnPress: () async{
                if(  k2.currentState.validate() ) {
                  try{
                  await fa.sendPasswordResetEmail(email:tc3.text );
                  tc3.clear();
    Toast.show('Reset password email sent',gravity: Toast.bottom,duration: Toast.lengthLong);
    }on FirebaseAuthException   catch(e){
                   Toast.show(e.message,gravity: Toast.bottom,duration: Toast.lengthLong);}
                }
              },
            ).show();
          }, child: const Text('Forget Password ?',style: TextStyle(color: Colors.black87))  )),
            ElevatedButton(onPressed: () async {  if(  k1.currentState.validate() )
            {try{
              await fa.signInWithEmailAndPassword(email: tc1.text, password: tc2.text);
              Get.off(()=>const home());
            }
            on FirebaseAuthException catch(e){
              Toast.show(e.message,gravity: Toast.bottom,duration: Toast.lengthLong);}
            }} ,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade400 ,
                  onPrimary: Colors.white, shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                  minimumSize: Size(MediaQuery.of(context).size.width/2 ,75), //////// HERE
                ),
                child: const Text('Sign In')),
          const Divider(), const Text('Or Sign In With',style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[SignInButton(
            Buttons.Facebook,mini: true,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) ,
            onPressed: ()async {
              final FacebookLoginResult o =
           await    v.logIn(permissions: [FacebookPermission.email]);
            switch (o.status) {
              case FacebookLoginStatus.success:
                {
                  p = await v.getUserProfile();
                  setState((){});
                  try {
                    final OAuthCredential facebookAuthCredential = FacebookAuthProvider
                        .credential(o.accessToken.token);
                    await fa.signInWithCredential(facebookAuthCredential);
                    Get.off(()=>const home());
                  } on FirebaseException catch (e) {
                    Toast.show(e.code, gravity: Toast.bottom,
                        duration: Toast.lengthLong);
                    v.logOut();}
                }
                break;
              case FacebookLoginStatus.cancel:
                break;
              case FacebookLoginStatus.error:
                {
                  Toast.show('Some Thing Went Error', gravity: Toast.bottom,
                      duration: Toast.lengthLong);
                } break;
            }
            },
          ), const Divider(),SignInButtonBuilder(
               icon: FontAwesomeIcons.google,
               mini: true,backgroundColor: Colors.redAccent,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) ,
                onPressed: () async{ try {
    await GoogleSignIn().signIn().then((value) async {
    setState(() {
    x = value;
    });
    final GoogleSignInAuthentication googleAuth = await x.authentication;
    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
    );await fa.signInWithCredential(credential);});
    Get.off(()=>const home());
                }
    on FirebaseException catch (e) {
    Toast.show(e.code, gravity: Toast.bottom,
    duration: Toast.lengthLong); }
    }, text: '',
               ),
    // const Divider(),SignInButton(
    //             Buttons.Twitter,mini: true,
    //             shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) ,
    //             onPressed: () async{
                //   try
                // }{
  // final ta=   await     twitterLogin.authorize();
  //         switch (ta.status) {
  //           case TwitterLoginStatus.loggedIn:
  //             {final tl=TwitterAuthProvider.credential(accessToken: ta.session.token, secret: ta.session.secret);
  //               await fa.signInWithCredential(tl);
  //               Get.off(()=>const home()); } break;
  //           case TwitterLoginStatus.cancelledByUser:
  //             break;
  //           case TwitterLoginStatus.error:
  //             break;
  //         }}
  //   on FirebaseException catch (e) {
  //   Toast.show(e.code, gravity: Toast.bottom,
  //   duration: Toast.lengthLong); }
  //                 },
  //             ),
                const Divider(),SignInButton(
                Buttons.GitHub,mini: true,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) ,
                onPressed: () async{try{
                  final GitHubSignIn gitHubSignIn = GitHubSignIn(
                      clientId: 'e772e95da4055ea24bb0',
                      clientSecret: '35ace68bd784e6d91e421ec1d87481381237f109',
                      redirectUrl: 'https://church-df3c1.firebaseapp.com/__/auth/handler');
                  var result = await gitHubSignIn.signIn(context);
                  switch (result.status) {
                    case GitHubSignInResultStatus.ok:
                     {final ga=GithubAuthProvider.credential(result.token);
                     await fa.signInWithCredential(ga);
                     Get.off(()=>const home()); }
                      break;
                    case GitHubSignInResultStatus.cancelled:
                    case GitHubSignInResultStatus.failed:
                      print(result.errorMessage);
                      break;
                  }}
                on FirebaseException catch (e) {
                  Toast.show(e.code, gravity: Toast.bottom,
                      duration: Toast.lengthLong); }
                },
              )]   )])
        )    )
    );
  }
}
