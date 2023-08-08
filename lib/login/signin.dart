import 'package:bmi/login/login.dart';
import 'package:bmi/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool isSecure = true;
  bool isSecure1 = true;

  final email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xffdafffb),
        elevation: 0,
      ),
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
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              welcome(),
              const SizedBox(height: 50),

              ///INPUTS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 45),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///email input
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
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
                          decoration:
                              InputDecoration(
                                      suffixIcon: null,
                                      label: const Text("Enter Email"),
                                      hintText: "email@exapmle.com",
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),),
                      const SizedBox(height: 20),

                      ///password input
                      ///PASS1
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
                              return 'password too short';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                                      suffixIcon: toggle(),
                                      label: const Text("Enter Password"),
                                      hintText: null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),),
                      const SizedBox(height: 20),

                      ///PASS2
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        controller: passwordd,
                        obscureText: isSecure1,
                        validator: (password1) {
                          if (password1!.isEmpty) {
                            return 'please fill this field';
                          } else if (password1.length < 8) {
                            return 'password too short';
                          } else if (passwordd.text != password.text) {
                            return 'password not similar';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                                      suffixIcon: toggle1(),
                                      label: const Text("Confirm Password"),
                                      hintText: null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              ///Signin
              SizedBox(
                width: w * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signin();
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

              const SizedBox(height: 5),
              icons(),
            ],
          ),
        ),
      ),
    );
  }

  

  Widget icons() {
    return Center(
      child: Column(
        children: [
          const Text("---------------------OR---------------------"),
          const Text("Sign-up using the following methods"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/google.png')),
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/facebook.png')),
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/twitter.png')),
            ],
          ),
        ],
      ),
    );
  }

  signin() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Widget welcome() {
    return const Column(
      children: [
        Text(
          'Create Your Account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'And Join Our Familly',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Widget toggle1() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure1 = !isSecure1;
        });
      },
      icon: isSecure1
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.black,
    );
  }
}
