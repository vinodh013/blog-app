import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/round_button.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('create Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder()),
                          onChanged: (String value) {
                            email = value;
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Entre email' : null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: TextFormField(
                            controller: passwordcontroller,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'password',
                                labelText: 'password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder()),
                            onChanged: (String value) {
                              password = value;
                            },
                            validator: (value) {
                              return value!.isEmpty ? 'Entre password' : null;
                            },
                          ),
                        ),
                        RoundButton(
                            Title: 'Register',
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  showSpinner = true;
                                });

                                try {
                                  final user = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email.toString().trim(),
                                          password: password.toString().trim());

                                  if (user != null) {
                                    print('success');
                                    toastMessage('user successfully created');
                                    setState(() {
                                      showSpinner = false;
                                    });
                                   
                                  }
                                } catch (e) {
                                  print(e.toString());
                                  toastMessage(e.toString());

                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              }
                            })
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
