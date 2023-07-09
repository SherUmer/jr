import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/forgetPassword.dart';
import 'package:jr/screens/register.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> map;
    String message;
    var dbclass = context.read<DataBase>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Login",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  height: 350,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Login & Get Exclusive membership with the mentor JR himself.",
                              style: GoogleFonts.montserrat(
                                  fontSize: 30.0, color: Colors.white),
                            ), //BoxDecoration
                          ), //Container
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // Text(
                        //     'Register and get access to 54,000 database records'),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Image(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/jrlogo.png'),
                              ) //BoxDecoration
                              ), //Container
                        )
                      ])),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        fontSize: 22, color: Theme.of(context).primaryColor),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    prefixIcon: const Icon(Icons.email),
                    suffixIcon: const Icon(Icons.check),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    // Set the style of the input text
                    hintStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility_off),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    // Set the style of the input text
                    hintStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ForgetPassword()));
                },
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  // color: Colors.purple,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    child: const Text('Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      // print(loginMap['message']);
                      var email = emailController.text.toString();
                      var password = passwordController.text.toString();
                      //print

                      dbclass.login(context, email, password);
                    },
                  )),
              const Divider(
                color: Colors.black12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Does not have account?',
                    style: GoogleFonts.montserrat(),
                  ),
                  TextButton(
                    child: Text(
                      'Register',
                      style: GoogleFonts.montserrat(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => const Register()));
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
