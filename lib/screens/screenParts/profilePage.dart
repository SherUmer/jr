import 'package:cached_network_image/cached_network_image.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jr/screens/widgets/homeTransformationPrograms.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/database.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    dbclass.fetchDiet(id);
    context.read<DataBase>().fetchDiet(id);

    return Scaffold(
      appBar: AppBar(title: const Text('Diet Plans'),),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Consumer<DataBase>(
            builder: ((context, value, child) {
              dbclass.fetchDiet(id);
              var map = value.mapDiet['diet'];
              return (value.mapDiet.isEmpty)
                  ? const Center(
                      child: SizedBox(
                        width: 50.0,
                        child: LinearProgressIndicator(
                          minHeight: 2.0,
                        ),
                      ),
                    )
                  :
                  // print('we are here ... above' + map.toString());
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: map.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 0.6),
                      itemBuilder: (BuildContext context, int index) {
                        // Map map = value.mapDiet['diet'];
                        print('yeh mera map hai -> ' + map.toString());
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plancard(
                                  image:
                                      'https://hips.hearstapps.com/rbk.h-cdn.co/assets/16/02/1600x800/landscape-1452790262-rbk-diet-dowork-index2.jpg?resize=480:*',
                                  title: 'Dite',
                                  description: map[index]['diet'],
                                  time: map[index]['timestamp'],
                                ),
                                const SizedBox(height: 15),
                                plancard(
                                  image:
                                      'https://assets.lybrate.com/q_auto:eco,f_auto,w_850/imgs/product/kwds/diet-chart/1600-Calorie-Diet-Chart-v1.jpg',
                                  title: 'calories',
                                  description: map[index]['calories'],
                                  time: map[index]['timestamp'],
                                ),
                                const SizedBox(height: 15),
                                plancard(
                                  image:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyr87IZhsUPuI7ugfG5kxGcbz5dzhle2Mr2g&usqp=CAU',
                                  title: 'nutrition',
                                  description: map[index]['nutrition'],
                                  time: map[index]['timestamp'],
                                ),
                                const SizedBox(height: 15),
                                plancard(
                                  image:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwRVRJofG3mz6xfUKRLm_6wg87g-GHGst9CQ&usqp=CAU',
                                  title: 'Plans',
                                  description: map[index]['plans'],
                                  time: map[index]['timestamp'],
                                ),
                                const SizedBox(height: 15),
                                plancard(
                                  image:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXNOwaiB51gZ48qdIeYvT7-dWLGjZRBDdSQ&usqp=CAU',
                                  title: 'Books',
                                  description: map[index]['books'],
                                  time: map[index]['timestamp'],
                                ),
                                const SizedBox(height: 15),
                                plancard(
                                  image:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoyP_tf5eylXbWkuow0ShZ-YLfTp8PWwy-Ag&usqp=CAU',
                                  title: 'Achievements',
                                  description: map[index]['achievements'],
                                  time: map[index]['timestamp'],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
//               physics: const ClampingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: value.mapDiet['Diet'].length,
//               itemBuilder: (context, index) {
//                 var map = value.mapDiet['Diet'][index];
//                 print(map['user_image']);
//                 return InkWell(
//                   onTap: () {
//                     // Navigator.of(context).push(
//                     //   // MaterialPageRoute(
//                     //   //   builder: (BuildContext context) =>
//                     //   //       dietDetail(map: map),
//                     //   // ),
//                     // );
//                   },
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.white12,
//                       radius: 25.0,
//                       child: ClipOval(
//                         child: CachedNetworkImage(
//                             height: 100.0,
//                             width: 100.0,
//                             fit: BoxFit.cover,
//                             imageUrl: map['user_image']),
//                       ),
//                     ),
//                     title: Text(
//                       map['topic'],
//                       style: GoogleFonts.montserrat(
//                           color: Theme.of(context).canvasColor),
//                       softWrap: true,
//                     ),
//                     subtitle: Text(
//                       map['description'],
//                       style: GoogleFonts.montserrat(color: Colors.white24),
//                       softWrap: true,
//                     ),
//                     trailing:
//                         const Icon(Icons.chevron_right, color: Colors.white12),
//                   ),
//                 );
//               },
//             );