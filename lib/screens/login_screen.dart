// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_import, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingslab_test/components/flush_bar.dart';
import 'package:kingslab_test/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  final usernameController = TextEditingController();
  final passController = TextEditingController();

  String? errorText;
  bool validate = false;
  bool circular = false;
  bool _isHidden = true;

  final storage = FlutterSecureStorage();
  void login(String username, String password) async {
    try {
      Response response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{"username": username, "password": password},
        ),
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        showFlushBar(
          title: "Success",
          message: "You have successfully logged in",
          icon: Icons.check_circle,
          context: context,
          color: Colors.green[400],
        );
      } else {
        showFlushBar(
          title: "Oops,Error",
          message: "Please enter valid Credientials and then try again.",
          icon: Icons.error,
          context: context,
          color: Colors.red[400],
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        height: 58,
                        width: MediaQuery.of(context).size.width,
                        color: HexColor('#F2F6FF'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle:
                                    TextStyle(color: HexColor("#BABABA")),
                                // prefixIcon: Icon(Icons.email),
                                border: InputBorder.none),
                            style: const TextStyle(fontSize: 16),
                            controller: usernameController,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        height: 58,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.black,
                        color: HexColor('#F2F6FF'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              // prefixIcon: const Icon(Icons.lock),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: HexColor("#BABABA")),
                              border: InputBorder.none,
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    _isHidden
                                        ?

                                        /// CHeck Show & Hide.
                                        Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                                fontFamily: "poppins", fontSize: 16),
                            controller: passController,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () async {
                            var username = usernameController.text;
                            var password = passController.text;

                            login(username, password);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('#42C3A7'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
