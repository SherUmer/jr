// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/forumDetail.dart';
import 'package:provider/provider.dart';

class Forums extends StatelessWidget {
  
  
   const Forums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    final topicController = TextEditingController();
  final descriptionController = TextEditingController();
  // final timeController = TextEditingController();
  // var date = new DateTime(2018, 1, 13);
  // var newDate = new DateTime(date.year, date.month - 1, date.day);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Forums'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: CachedNetworkImage(
                imageUrl: 'https://jansherjr.com/img/forums.jpeg',
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'JR Forums',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor),
                    softWrap: true,
                  ),
                  ElevatedButton(
                    child: const Text('Add a new Topic'),
                    onPressed: () {
                      showDialog(
                        
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            
                            "Add a new Topic",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  child:  TextField(
                                    controller: topicController,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Topic',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.15,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  child:  TextField(
                                    controller: descriptionController,
                                    maxLines: 4,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      labelText: 'Description',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("Close"),
                              ),
                            ),
                            TextButton(
                                onPressed: ()  async{
                        Map.identity();
                        String  id='1';
                        var topic = topicController.text;
                        var description = descriptionController.text;


                        // String topicId='1';

                        // //print
                          await dbclass.addForum(
                            id,topic,description );
                            Navigator.of(ctx).pop();
                            
                          // print('hello'+ dbclass.addForum.toString());
                       // map = dbclass.mapedit_user;
                        //message =  dbclass.mapLogin['message'].toString();
                          // print(emailController.text);
                          // print(passwordController.text);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                color: Theme.of(context).primaryColor,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              child: Consumer<DataBase>(builder: (context, value, child) {
                return value.mapForums.isEmpty && !value.errorForums
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black12,
                          backgroundColor: Colors.black12,
                        ),
                      )
                    : value.errorForums
                        ? Text(
                            'Oops, something went wrong .${value.errorMessageForums}',
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.mapForums['forum'].length,
                            itemBuilder: (context, index) {
                              var map = value.mapForums['forum'][index];
                              String name = map['name'];

                              var finalName = name .toUpperCase() +
                                  name.substring(1).toLowerCase();
                              return ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForumDetail(map: map),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white12,
                                  child: CachedNetworkImage(
                                      height: 100.0,
                                      width: 100.0,
                                      fit: BoxFit.cover,
                                      imageUrl: map['user_image']),
                                ),
                                title: Text(
                                  map['topic'],
                                  style: GoogleFonts.montserrat(
                                      color: Theme.of(context).canvasColor),
                                  softWrap: true,
                                ),
                                subtitle: Text(
                                  map['description'].length > 100
                                      ? map['description'].substring(0, 100) +
                                          '...'
                                      : map['description'],
                                  style: const TextStyle(
                                    color: Colors.white24,
                                  ),
                                ),
                                // Text(
                                //   map['description'],
                                //   style: GoogleFonts.montserrat(
                                //       color: Colors.white24),
                                //   softWrap: true,
                                // ),
                                trailing: const Icon(Icons.chevron_right,
                                    color: Colors.white12),
                              );
                            });
              }),
            ),

            
            // ListView(
            //   physics: const ClampingScrollPhysics(),
            //   shrinkWrap: true,
            //   children: [
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/img/hero.JPG'),
            //       ),
            //       title: Text(
            //         'Benefits of Online Coaching', 
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'I have heard about the topics online and went ahead to sign up ... ',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/admin/img/1.JPG'),
            //       ),
            //       title: Text(
            //         'Advantages to sign up',
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'The simple process to get your body back in shape ...  ',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/img/10.JPG'),
            //       ),
            //       title: Text(
            //         'Online Coaching is important ?',
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'The benefits of online coaching with JR has been ....',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/img/13%20%282%29.JPG'),
            //       ),
            //       title: Text(
            //         'Benefits of Online Coaching',
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'I have heard about the topics online and went ahead to sign up ... ',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/img/2.jpg'),
            //       ),
            //       title: Text(
            //         'Benefits of Online Coaching',
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'I have heard about the topics online and went ahead to sign up ... ',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         backgroundColor: Colors.white12,
            //         child: CachedNetworkImage(
            //             height: 100.0,
            //             width: 100.0,
            //             fit: BoxFit.cover,
            //             imageUrl: 'https://jansherjr.com/img/badee.jpeg'),
            //       ),
            //       title: Text(
            //         'Benefits of Online Coaching',
            //         style: GoogleFonts.montserrat(
            //             color: Theme.of(context).canvasColor),
            //         softWrap: true,
            //       ),
            //       subtitle: Text(
            //         'I have heard about the topics online and went ahead to sign up ... ',
            //         style: GoogleFonts.montserrat(color: Colors.white24),
            //         softWrap: true,
            //       ),
            //       trailing:
            //           const Icon(Icons.chevron_right, color: Colors.white12),
            //     ),
            //   ],
            // ),
            
          ],
        ),
      ),
    );
  }
}
