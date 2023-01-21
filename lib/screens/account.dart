import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';

class Account extends StatelessWidget {

  Account({Key? key, required this.id,}) : super(key: key);
    final String id;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  //final Map map;

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> map;
    var dbclass = context.read<DataBase>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.black12,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https://mrworker.pk/img/avatardefault.png",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.4,
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       image: NetworkImage("https://mrworker.pk/img/avatardefault.png"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 4,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(3),
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.white,
                  //     ),
                  //     child: Container(
                  //       padding: const EdgeInsets.all(5),
                  //       decoration: const BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Colors.blue,
                  //       ),
                  //       child: InkWell(
                  //         onTap: () async {
                  //           // //getImage(false);
                  //           // //getVedio(false);
                  //           // var pickedFile = await ImagePicker()
                  //           //     .pickImage(source: ImageSource.gallery);
                  //           // db.setProfileImage(File(pickedFile!.path));
                  //         },
                  //         child: const Icon(
                  //           Icons.add_a_photo,
                  //           size: 30,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: () async {
                        Map.identity();
                        var name = nameController.text.toString();
                        var email = emailController.text.toString();
                        var phone = phoneController.text.toString();
                        var city = cityController.text.toString();
                        var address = addressController.text.toString();
                        var password = passwordController.text.toString();
                        //print
                         await dbclass.edit_user(
                            name, email, phone, city, address, password);
                          print('hello'+ dbclass.mapedit_user.toString());
                       // map = dbclass.mapedit_user;
                        //message =  dbclass.mapLogin['message'].toString();
                          // print(emailController.text);
                          // print(passwordController.text);
                        },
                      child: const Padding(
                        
                        padding: EdgeInsets.all(18.0),
                        child: Center(child: Text('Update')),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
