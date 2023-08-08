import 'package:bmi/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signin.dart';
import 'password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff001c30),
              Color(0xff176b87),
              Color(0xff64ccc5),
              Color(0xffdafffb),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ///// welcome text/////
                  const SizedBox(height: 80),
                  welcome(),
                  const SizedBox(height: 50),
                  ////// INPUTS //////
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 45),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          //////email input//////////
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value)) {
                                return 'please enter a valid email';
                              } else if (value.isEmpty) {
                                return 'please fill this field';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: null,
                              label: const Text("Enter Email"),
                              hintText: "email@exapmle.com",
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          ///// password input /////

                          const Text(
                            'Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: isSecure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please fill this field';
                              } else if (value.length < 8) {
                                return 'password must be longuer than 8 digits';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: toggle(),
                              label: const Text("Enter Password"),
                              hintText: null,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  //Forgot Pass
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      TextButton(
                        onPressed: () {
                          resetpass(context);
                        },
                        child: const Text(
                          'Forgot Your Password ?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Login Button
                  SizedBox(
                    width: w * 0.5,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          login(context, email, password);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //Create Accouunt
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignIn()));
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  login(context, email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
      //fire succesful

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email Or Password Is Incorrect !')));
    });
  }

  Widget welcome() {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          'Hello',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign into your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Widget toggle() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure = !isSecure;
        });
      },
      icon: isSecure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.black,
    );
  }
}
