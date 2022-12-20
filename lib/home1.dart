import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/services/firebase_services.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Second page',
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            centerTitle: true,
            title: Text("Home Screen"),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
            BoxDecoration(border: Border.all(color: Colors.black38)),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 250,
                    height: 250,
                    child: Image(
                      image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 45),
                  width: 500,
                  child: Text(
                    "Name : ${FirebaseAuth.instance.currentUser?.displayName}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 300,
                  child: Text(
                    "Email : ${FirebaseAuth.instance.currentUser?.email}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 500,
                    child: Center(
                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(primary: Colors.black38),
                        child: Text("Logout"),
                        onPressed: () async{
                          await Firebaseservices().signOut();
                          Navigator.pop(context);
                        },
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

