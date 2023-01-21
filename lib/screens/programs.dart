import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/progarmDetail1.dart';
import 'package:jr/screens/programDetail.dart';
import 'package:jr/screens/programDetail2.dart';
import 'package:provider/provider.dart';

class Programs extends StatelessWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ProgramDetail(),
                ),
              );
            },
            child: const TempCard(
              image: 'https://jansherjr.com/img/2.webp',
              title: 'LifeStyle',
              description:
                  'A Lifestyle Program For Those Waiting To Achieve Their Personal Fitness & Physique Goals.',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ProgramDetail1(),
                ),
              );
            },
            child: const TempCard(
              image: 'https://jansherjr.com/img/competition.jpg',
              title: 'Competition',
              description:
                  'A Competition Program For Those Wanting To Compete In An Upcoming Fitness Competition.',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ProgramDetail2(),
                ),
              );
            },
            child: const TempCard(
              image: 'https://jansherjr.com/img/jr1.jpg',
              title: 'Posing',
              description:
                  'A 1v1 Online Posing Consultation Session To Help You Better Present Your Physique On Stage',
            ),
          )
        ],
      ),
    );
  }
}

class TempCard extends StatelessWidget {
  const TempCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   // print(map);
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) {
      //         return DetailPage(map: map);
      //       },
      //     ),
      //   );
      // },
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                      child: SizedBox(
                        width: 50.0,
                        child: LinearProgressIndicator(),
                      ),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2),
            Positioned(
              right: 15,
              top: 15,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Begin Now',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).secondaryHeaderColor),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            description,
                            style: GoogleFonts.ubuntu(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
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
  }
}
