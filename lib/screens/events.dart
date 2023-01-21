import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/screens/screenParts/productDetail.dart';
import 'package:jr/screens/widgets/homeTransformationPrograms.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    context.read<DataBase>().fetchevents;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                children: [
                  Text(
                    'Up Coming Events',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Theme.of(context).primaryColor),
                    softWrap: true,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<DataBase>(
                builder: (context, value, child) {
                  dbclass.fetchevents;
                  var map = value.mapevents['events'];
                  return GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(map);
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ProductDetail(map: map[index]);
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl: map[index]['image'].toString(),
                                  fit: BoxFit.cover,
                                  width: 350,
                                  height: 350),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: Card(
                                  color: Theme.of(context).primaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      map[index]['date'].toString(),
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black54,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              map[index]['title'].toString(),
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              map[index]['description']
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                  );
                },
              ),
            ),








              // SizedBox(
              //   height: MediaQuery.of(context).size.height,
              //   child: ListView(
              //     addAutomaticKeepAlives: true,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.vertical,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           // Navigator.of(context).push(
              //           //   MaterialPageRoute(
              //           //     builder: (BuildContext context) =>
              //           //         const ProgramDetail1(),
              //           //   ),
              //           // );
              //         },
              //         child: const TempCardcoming(
              //           image:
              //               'https://images.squarespace-cdn.com/content/v1/56e487181d07c0743d227289/1660660739254-RDY6PVTPI2H8XMA5LZPR/Copy+of+Add+a+subheading.png?format=1000w',
              //           title: 'Competition',
              //           description:
              //               'A Competition Program For Those Wanting To Compete In An Upcoming Fitness Competition.',
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           // Navigator.of(context).push(
              //           //   MaterialPageRoute(
              //           //     builder: (BuildContext context) =>
              //           //         const ProgramDetail2(),
              //           //   ),
              //           // );
              //         },
              //         child: const TempCardcoming(
              //           image: 'https://jansherjr.com/img/jr1.jpg',
              //           title: 'Posing',
              //           description:
              //               'A 1v1 Online Posing Consultation Session To Help You Better Present Your Physique On Stage',
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           // Navigator.of(context).push(
              //           //   MaterialPageRoute(
              //           //     builder: (BuildContext context) =>
              //           //         const ProgramDetail(),
              //           //   ),
              //           // );
              //         },
              //         child: const TempCardcoming(
              //           image: 'https://jansherjr.com/img/2.webp',
              //           title: 'LifeStyle',
              //           description:
              //               'A Lifestyle Program For Those Waiting To Achieve Their Personal Fitness & Physique Goals.',
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           // Navigator.of(context).push(
              //           //   MaterialPageRoute(
              //           //     builder: (BuildContext context) =>
              //           //         const ProgramDetail1(),
              //           //   ),
              //           // );
              //         },
              //         child: const TempCardcoming(
              //           image: 'https://jansherjr.com/img/competition.jpg',
              //           title: 'Competition',
              //           description:
              //               'A Competition Program For Those Wanting To Compete In An Upcoming Fitness Competition.',
              //         ),
              //       ),
                    
              //       const SizedBox(height: 200,)
              //     ],
              //   ),
              // ),
             
            ],
          ),
        ),
      ),
    );
  }
}
