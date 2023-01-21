import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/forgetPassword.dart';
import 'package:jr/screens/home.dart';
import 'package:jr/screens/register.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
 final emailController = TextEditingController();
    final  passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map;
    String message;
    var dbclass = context.read<DataBase>();

   
    // TextEditingController emailController =  TextEditingController();
    // TextEditingController passwordController =  TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           // crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        'Welcome back',
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Welcome back, you have been missed.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Icon(Icons.account_circle,
                  color: Theme.of(context).primaryColor,
                  size: MediaQuery.of(context).size.width / 3),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  //enableInteractiveSelection: false,
                  controller: emailController,
                  
                  decoration:  const InputDecoration(
                    
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  var email = emailController.text.toString();
                  var password = passwordController.text.toString();
                  //print
                  var userclass = await dbclass.userLogin(email, password);
                  map = dbclass.mapLogin;
                  message =  dbclass.mapLogin['message'].toString();
                  if (map.isEmpty) {
                    print('map is empty');
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Warning', style: GoogleFonts.montserrat()),
                        content: FutureBuilder(
                          future: dbclass.userLogin(email, password),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data.toString(),
                                softWrap: true,
                                style: GoogleFonts.montserrat(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              );
                            } else {
                              return const SizedBox(
                                height: 100,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(); // dismisses only the dialog and returns nothing
                            },
                            child: Text(
                              'Try again',
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    if (message.isNotEmpty && message == 'True') {
                      //shared prefs !!!
                      dbclass.islog=true;
                      dbclass.name;

                      print('True');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ),
                      );
                    } else if (message.isNotEmpty && message == 'False') {
                      print('False');
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Warning',
                            style: GoogleFonts.montserrat(),
                          ),
                          content: Text(
                            'Invalid Credentials,Login Failed',
                            style: GoogleFonts.montserrat(),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(); // dismisses only the dialog and returns nothing
                              },
                              child: Text(
                                'Try again',
                                style: GoogleFonts.montserrat(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  print(emailController.text);
                  print(passwordController.text);
                },
                
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text('Login'),
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Register(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text('Register'),
                ),
              ),
              const Divider(
                color: Colors.grey,
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
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
