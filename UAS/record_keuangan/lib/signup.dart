import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:record_keuangan/database.dart';
import 'package:record_keuangan/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signupp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Signupp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Warung"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Sign up",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                  child: Form(
                child: Column(children: [
                  TextFormField(
                    controller: userController,
                    onSaved: (value) {
                      userController.text = value!;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        labelText: "Username",
                        hintText: "Enter your username here"),
                  ),
                  TextFormField(
                    controller: emailController,
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person_add),
                        labelText: "Email",
                        hintText: "Enter your email here"),
                  ),
                  TextFormField(
                    obscureText: true,
                    onSaved: (value) {
                      passController.text = value!;
                    },
                    controller: passController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: "Password",
                        hintText: "please enter your password"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Signup(emailController.text, passController.text);
                            emailController.clear();
                            passController.clear();
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) {
                              return Signinn();
                            }));
                          },
                          child: Text("Sign up")),
                    ],
                  ),
                ]),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void Signup(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.username = userController.text;
    userModel.email = user!.email;
    userModel.password = passController.text;

    await firebaseFirestore
        .collection("AkunmyApp")
        .doc(user.email)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
