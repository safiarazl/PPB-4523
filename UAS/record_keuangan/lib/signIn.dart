import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:record_keuangan/warung.dart';
import 'package:record_keuangan/signup.dart';

class Signinn extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Signinn> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();

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
                  "Sign in",
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
                            Signin(emailController.text, passController.text);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Warung();
                            }));
                          },
                          child: Text("Sign in"))
                    ],
                  ),
                  Card(
                    child: Row(
                      children: [
                        Text("Dont have account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Signupp();
                              }));
                            },
                            child: Text("Sign up"))
                      ],
                    ),
                  )
                ]),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void Signin(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
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
}
