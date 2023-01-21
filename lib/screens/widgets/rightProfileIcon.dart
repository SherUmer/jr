// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/account.dart';
import 'package:jr/screens/login.dart';
import 'package:jr/screens/screenParts/profilePage.dart';
import 'package:provider/provider.dart';

class RightProfileIcon extends StatelessWidget {
  const RightProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


     Map<String, dynamic> _mapLocation;
    Future<void> GetCity(String value) async {
      final response = await http
          .get(Uri.parse('https://jansherjr.com/api/diet.php?user_id=1' ));
      if (response.statusCode == 200) {
        _mapLocation = jsonDecode(response.body);
        //print(_mapLocation.toString());
      }
    }





    bool isLoggedIn;
    context.read<DataBase>().checkAuth();
    var dbclass = context.read<DataBase>();

    if (dbclass.isLoggedIn == true) {
      isLoggedIn = dbclass.isLoggedIn;
      print('you are logged in');
    } else {
      isLoggedIn = dbclass.isLoggedIn;
      // print('false');
    }

    return Consumer<DataBase>(
      builder: (context, val, child) {
        // print(val.isLoggedIn);
        if (val.isLoggedIn == false) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Login()),
                );
              },
              child: const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.black12,
                child: ClipOval(
                    child: Icon(Icons.account_circle, color: Colors.white)),
              ),
            ),
          );
        } else {
          return CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.black12,
            child: InkWell(
              onTap: () async {
                var id = dbclass.id.toString();
                print(id);
                showDialog<void>(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 50, right: 50),
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12, spreadRadius: 2),
                              ],
                            ),
                            child: Column(
                             // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: ()  {
                                    GetCity('1');
                                    var id = dbclass.id.toString();
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfilePage(

                                          id: id,
                                        ),
                                      ),
                                    );
                                    print(' Edit Profile Page');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(FontAwesomeIcons.user,
                                            size: 16.0,
                                            color:
                                                Theme.of(context).primaryColor),
                                        Text(
                                          'Account',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                                ElevatedButton(
                                  onPressed: ()  {

                                    // Map<String, dynamic> userMap =
                                    //    dbclass.edit_user('name', 'email', 'password', 'phone', 'city') as Map<String, dynamic>;
                                    print(' Profile Page');
                                    var id = dbclass.id.toString();
                                    Navigator.of(context).pop();
                                  //  print('hello'+userMap.toString());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Account(

                                          id: id,

                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.edit,
                                            size: 12.0,
                                            color:
                                                Theme.of(context).primaryColor),
                                        Text(
                                          'Edit Profile',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                                ElevatedButton(
                                  onPressed: () {
                                    dbclass.removeUser();
                                    dbclass.logOut();
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.lock,
                                            size: 16.0,
                                            color:
                                                Theme.of(context).primaryColor),
                                        Text(
                                          ' Logout',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: dbclass.image,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
