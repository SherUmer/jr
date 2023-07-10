import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/screens/account.dart';
import 'package:jr/screens/login.dart';
import 'package:jr/screens/register.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';

class ProgramDetail extends StatelessWidget {
  const ProgramDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text(
          'LifeStyle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                imageUrl: 'https://jansherjr.com/img/2.webp',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'JANSHER\'S PERSONALIZED LIFESTYLE COACHING PROGRAM',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor),
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'A Lifestyle Program For Those Waiting To Achieve Their Personal Fitness & Physique Goals. Fitness is a journey, not a destination. And for many people that journey can be frustrating and at times very long, but with perseverance and the right support system in place it’s possible to achieve your personal fitness goals! With the help of an expert there are hundreds of great lifestyle programs available to get you started on achieving your goals.',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Theme.of(context).secondaryHeaderColor),
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Consumer<DataBase>(builder: (context, value, child) {
              return Center(
                  child: dbclass.islog == true
                      ? Text('')
                      : ElevatedButton(
                          onPressed: () {
                            //Navigator.push(context, Register());
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Login(),
                              ),
                            );
                          },
                          child: const Text('Enroll Now'),
                        ));
            }),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
}
