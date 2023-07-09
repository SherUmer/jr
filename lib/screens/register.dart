import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/forgetPassword.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message;
    var dbclass = context.read<DataBase>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        // backgroundColor: Theme.of(context).backgroundColor,
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
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: InputField(
                        labelText: 'Complete Name',
                        hintText: 'Enter your name',
                        prefixIcon: Icons.person,
                        suffixIcon: Icons.check,
                        controller: nameController,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: InputField(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icons.email,
                        suffixIcon: Icons.check,
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: InputField(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.check,
                        controller: passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: InputField(
                        labelText: 'Phone',
                        hintText: 'Enter your phone number',
                        prefixIcon: Icons.phone,
                        suffixIcon: Icons.check,
                        controller: phoneController,
                        // keyboardType: TextInputType.phone,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your phone number';
                        //   }
                        //   if (value.length!= 10) {
                        //     return 'Please enter a valid phone number';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var name = nameController.text.toString();
                        var email = emailController.text.toString();
                        var password = passwordController.text.toString();
                        var phone = phoneController.text.toString();
                        dbclass.register(
                          context,
                          name,
                          email,
                          password,
                          phone,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('Register'),
                      ),
                    ),
                  ],
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
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
