import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/screenParts/productDetail.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    context.read<DataBase>().fetchForums;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merch Store'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: CachedNetworkImage(
                imageUrl: 'https://jansherjr.com/img/store.jpeg',
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'JR Store',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor),
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<DataBase>(
                builder: (context, value, child) {
                  dbclass.fetchStore;
                  var map = value.mapStore['store'];
                  return GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(map);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetail(map: map[index]);
                              },
                            ),
                          );
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
                                  imageUrl: map[index]['file'].toString(),
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
                                      map[index]['price'].toString(),
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
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
