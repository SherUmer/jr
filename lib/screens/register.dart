import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/screens/forgetPassword.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        'Register',
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Welcome to JR Official App and Register.',
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
                child: const TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Complete Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: const TextField(
                  decoration: InputDecoration(
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
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: const TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {},
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
