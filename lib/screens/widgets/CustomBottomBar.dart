import 'package:flutter/material.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/Forums.dart';
import 'package:jr/screens/account.dart';
import 'package:jr/screens/auth.dart';
import 'package:jr/screens/login.dart';
import 'package:jr/screens/screenParts/profilePage.dart';
import 'package:provider/provider.dart';

import '../Store.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().checkAuth();
    var dbclass = context.read<DataBase>();
    return Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.black12,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.red,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: const TextStyle(color: Colors.yellow))),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Shifting
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (value) {
          if (value == 1) {
            print('PLans');
            var id = dbclass.id.toString();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>   ProfilePage(id: id,),
              ),
            );
          }
          if (value == 2) {
            print('Forums');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const Forums(),
              ),
            );
          }
          if (value == 3) {
            print('Store');
            (dbclass.isLoggedIn == true)
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Store(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Login(),
                    ),
                  );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Forums',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Merch Store',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          // ),
        ],
      ),
    );
  }
}
