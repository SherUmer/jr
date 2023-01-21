import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Center(child: Text('Forgot Password')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, right: 10),
            child: Column(
              children: [
                Text(
                  'Welcome Dear..',
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: const [
                Text(
                  'If you Forgot Your Password? \nPlease enter your Email...',
                  style:
                  
                   TextStyle(color: Colors.grey,fontSize: 17),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                //controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){}, child: const Text('Submit'))
        ],
      ),
    );
  }
}
