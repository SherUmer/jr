import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/Forums.dart';
import 'package:jr/screens/forumDetail.dart';
import 'package:provider/provider.dart';

class HomeForums extends StatelessWidget {
  const HomeForums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    context.read<DataBase>().fetchForums;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Forum Topics',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColor),
                  softWrap: true,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  Forums(),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Theme.of(context).canvasColor),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Consumer<DataBase>(
            builder: ((context, value, child) {
              if (value.mapForums.isEmpty || value.mapForums == null) {
                return const SizedBox(
                  width: 50.0,
                  child: LinearProgressIndicator(
                    minHeight: 2.0,
                  ),
                );
              } else {
                return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.mapForums['forum'].length,
                    itemBuilder: (context, index) {
                      var map = value.mapForums['forum'][index];
                      print(map['user_image']);
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForumDetail(map: map),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white12,
                            radius: 25.0,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                  imageUrl: map['user_image']),
                            ),
                          ),
                          title: Text(
                            map['topic'],
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).canvasColor),
                            softWrap: true,
                          ),
                          subtitle: Text(
                            map['description'],
                            style:
                                GoogleFonts.montserrat(color: Colors.white24),
                            softWrap: true,
                          ),
                          trailing: const Icon(Icons.chevron_right,
                              color: Colors.white12),
                        ),
                      );
                    },
                    );
              }
            }),
          ),
        ],
      ),
    );
  }
}
