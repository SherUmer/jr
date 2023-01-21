import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ForumDetail extends StatelessWidget {
  final Map map;
  //final String id;
  
   ForumDetail({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          ListTile(
            leading: CachedNetworkImage(
              imageUrl: map['user_image'],
            ),
            title: Text(
              

              map['topic'],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            subtitle: Text(
              map['description'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            map.toString(),
          ),
        ],
      ),
    );
  }
}
