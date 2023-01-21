import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/Store.dart';
import 'package:provider/provider.dart';

import '../screenParts/productDetail.dart';

class HomeMerchStore extends StatelessWidget {
  const HomeMerchStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    context.read<DataBase>().fetchStore;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Store Picks',
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
                      builder: (BuildContext context) => const Store(),
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
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Consumer<DataBase>(
                builder: (context, value, child) {
                  dbclass.fetchStore;
                  return value.mapStore.isEmpty && !value.errorStore
                      ? const Center(
                          child: SizedBox(
                            width: 50.0,
                            child: LinearProgressIndicator(
                              minHeight: 2.0,
                            ),
                          ),
                        )
                      : value.errorStore
                          ? Text(
                              'Oops, something went wrong .${value.errorMessageStore}',
                              textAlign: TextAlign.center,
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.mapStore['store'].length,
                              itemBuilder: (context, index) {
                                var map = value.mapStore['store'][index];
                                String title = map['title'];

                                var finalName = title[0].toUpperCase() +
                                    title.substring(1).toLowerCase();
                                return InkWell(
                                  onTap: () {
                                    print(map['title'].toString());
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ProductDetail(map: map),
                                      ),
                                    );
                                  },
                                  child: MerchCard(
                                    price: map['price'],
                                    image: map['file'],
                                    title: map['title'],
                                    description: map['description'],
                                  ),
                                );
                              },
                            );
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: 350,
          //   child: ListView(
          //     addAutomaticKeepAlives: true,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     children: const [
          //       MerchCard(
          //         price: '1000 PKR',
          //         image: 'https://jansherjr.com/img/red_sample.png',
          //         title: 'Cotton Fabric',
          //         description:
          //             'Top seller picks here, One of the best tee\'s by JR',
          //       ),
          //       MerchCard(
          //         price: '1000 PKR',
          //         image: 'https://jansherjr.com/img/red_sample.png',
          //         title: 'Stretchable Workout Fit',
          //         description: 'Fresh stock in multiple colours now available.',
          //       ),
          //       MerchCard(
          //         price: '1000 PKR',
          //         image: 'https://jansherjr.com/img/red_sample.png',
          //         title: 'Casual Wear',
          //         description:
          //             'A perfect fit for your body with the cool JR logo shirt.',
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 20.0,
          // )
        ],
      ),
    );
  }
}

class MerchCard extends StatelessWidget {
  const MerchCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.description})
      : super(key: key);
  final String image;
  final String title;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: image,
              fit: BoxFit.cover,
              width: 250,
              height: 350),
          Positioned(
            right: 15,
            top: 15,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  price,
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
    );
  }
}
