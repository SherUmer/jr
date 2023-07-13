import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ForumDetail extends StatelessWidget {
  final Map map;
  //final String id;

  ForumDetail({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List comments = map['comments'];
    print(comments);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ListView.builder(
              itemCount: comments.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        width: 50,
                        fit: BoxFit.cover,
                        imageUrl: 'https://jansherjr.com/' +
                            comments[index]['user_image'],
                      ),
                      title: Text(
                        comments[index]['user_name'],
                      ),
                      subtitle: Text(comments[index]['comment']),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
