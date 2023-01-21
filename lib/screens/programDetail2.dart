import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';
import 'login.dart';

class ProgramDetail2 extends StatelessWidget {
  const ProgramDetail2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeStyle'),
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
                imageUrl: 'https://jansherjr.com/img/jr1.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'JANSHER\'S 20 MINUTE LIVE POSING PRACTICE SESSION',
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
                'It\'s no secret that being a bodybuilder is not an easy task. It takes dedication, time, and effort to get your physique looking like it belongs on stage. But if you\'re feeling uncertain about what the judges are looking for in terms of pose angles, angles of the body, how to stand properly or where to place your feet onstage, then it might be time to call in a professional.',
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
                          },
                          child: const Text('Enroll Now'),
                        ));
              const SizedBox(
                height: 15.0,
              );
            },),
          ],
        ),
      ),
    );
  }
}
