import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/screens/progarmDetail1.dart';
import 'package:jr/screens/programDetail.dart';
import 'package:jr/screens/programDetail2.dart';

class HomeTransformationPrograms extends StatelessWidget {
  const HomeTransformationPrograms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Transformation Programs',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor),
                softWrap: true,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 350,
            child: ListView(
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ProgramDetail(),
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
                        builder: (BuildContext context) =>
                            const ProgramDetail1(),
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
                        builder: (BuildContext context) =>
                            const ProgramDetail2(),
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
          ),
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
        width: 350,
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

class TempCardcoming extends StatelessWidget {
  const TempCardcoming(
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
        width: 350,
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
                    'Coming Event',
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


class plancard extends StatelessWidget {
  const plancard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.time})
      : super(key: key);
  final String image;
  final String title;
  final String description;
  final String time;

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
          borderRadius: BorderRadius.circular(20),
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
                width: 350,
                height: 150),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            Text(
                            time,
                            style: GoogleFonts.ubuntu(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          ],)
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



