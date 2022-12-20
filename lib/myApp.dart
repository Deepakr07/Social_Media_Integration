import 'package:flutter/material.dart';
import 'package:login/services/firebase_services.dart';
import 'home1.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: homeScreen());

  }
}
class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: Text("WELCOME BACK")),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Image(image: AssetImage('asset/login.webp'), fit: BoxFit.cover,),
              margin: EdgeInsets.only(top: 100),
            ),
            SizedBox(height: 20,),
            Text('LOGIN', style: TextStyle(fontSize: 25)),
            SizedBox(height: 50,),
            Container(
              width: 320,
              height: 50,

              decoration: BoxDecoration(color: Colors.grey,border: Border.all(color: Colors.grey)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black38,
                  ),
                  onPressed :() {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Home1()));
                  },child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook_outlined),
                  SizedBox(width: 15,),
                  Text("Sign in with Facebook", style: TextStyle(fontSize: 17),),
                ],
              )),
            ),

            SizedBox(height: 20,),
            Container(

              width: 320,
              height: 50,

              decoration: BoxDecoration(color: Colors.grey,border: Border.all(color: Colors.grey)),
              child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black38,
                  ),
                  onPressed :() async {
                    await Firebaseservices().sigInWithGoogle();
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Home1()));
                  },child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 0,),
                  Image(image: AssetImage("asset/google.webp"),width: 23,),
                  SizedBox(width: 20,),
                  Text("Sign in with Google", style: TextStyle(fontSize: 17),),
                ],
              )
              ),),
          ],
        ),
      ),
    );
  }
}



