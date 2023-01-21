import 'package:flutter/material.dart';
import 'package:jr/screens/Forums.dart';
import 'package:jr/screens/Store.dart';
import 'package:jr/screens/account.dart';
import 'package:jr/screens/athletes.dart';
import 'package:jr/screens/auth.dart';
import 'package:jr/screens/login.dart';
import 'package:jr/screens/programs.dart';
import 'package:jr/screens/screenParts/profilePage.dart';
import 'package:provider/provider.dart';

import '../../models/database.dart';
import '../events.dart';
import '../report.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().checkAuth();
    var dbclass = context.read<DataBase>();
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          Consumer<DataBase>(builder: (context, val, child) {
            if (val.isLoggedIn == false) {
              return _createDrawerItem(
                context: context,
                icon: Icons.account_circle,
                text: 'Login / Register',
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>  Login(),
                    ),
                  );
                },
              );
            } else {
              return _createDrawerItem(
                context: context,
                icon: Icons.account_circle,
                text: 'Account',
                onTap: () {
                  Navigator.of(context).pop();
                  var id = dbclass.id.toString();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProfilePage(id: id),
                    ),
                  );
                },
              );
            }
          }),
          _createDrawerItem(
            context: context,
            icon: Icons.event,
            text: 'Up Coming Events',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const Events(),
                ),
              );
            },
          ),
          _createDrawerItem(
            context: context,
            icon: Icons.list,
            text: 'Forums',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>  Forums(),
                ),
              );
            },
          ),
          const Divider(),
          _createDrawerItem(
              context: context,
              icon: Icons.add_shopping_cart,
              text: 'Merch Store',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Store(),
                  ),
                );
              }),
          // _createDrawerItem(
          //     context: context,
          //     icon: Icons.face,
          //     text: 'Athletes',
          //     onTap: () {
          //        Navigator.of(context).pop();
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (BuildContext context) => const Athletes(),
          //         ),
          //       );
          //     }),
          _createDrawerItem(
              context: context,
              icon: Icons.stars,
              text: 'Programs',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Programs(),
                  ),
                );
              }),
          const Divider(
            color: Colors.grey,
          ),
          _createDrawerItem(
              context: context,
              icon: Icons.bug_report,
              text: 'Report an issue',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ReportIssue(),
                  ),
                );
              }),
          ListTile(
            title: const Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/jr11.jpeg'),
      ),
    ),
    child: Stack(
      children: const <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            "Welcome, back",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}

Widget _createDrawerItem(
    {required IconData icon,
    required String text,
    required context,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, color: Colors.grey),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            softWrap: true,
            style: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
