import 'package:appvalidation/register_page.dart';

import 'package:flutter/material.dart';

//import 'bgimage_page.dart';

class LoginP extends StatefulWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  _LoginPState createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // String gmail = "";
  // var password = "";
  bool isVisible = true;

  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const BgImagePage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                color: Colors.white.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text(
                                "Gmail",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              suffix: Icon(Icons.mail, color: Colors.white),
                            ),
                            validator: (value) {
                              return emailValidation(value);
                            },
                            // onSaved: (newValue) {
                            //   gmail = newValue!;
                            // },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: isVisible ? true : false,
                            decoration: InputDecoration(
                              label: const Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                              suffix: IconButton(
                                color: Colors.white,
                                icon: isVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  setState(
                                    () {
                                      isVisible = !isVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                            validator: (value) {
                              return passwordValidation(value);
                            },
                            // onSaved: (newValue) {
                            //   password = newValue!;
                            // }
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            logInButton();
                          },
                          child: const Text("Login"),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            logInButton();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  emailValidation(var value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!value.contains('@')) {
      return 'Please Enter Correct Email';
    }
    return;
  }

  passwordValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value.length <= 7) {
      return 'password should be 8 characters';
    }
    return null;
  }

  logInButton() {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      formkey.currentState!.save();
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Your Gmail or Password Is Incorrect",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.red,
      ));
    } else if (isValid) {
      return Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegisterPage()));
    }
  }
}
