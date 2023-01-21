import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.map}) : super(key: key);
  final Map<dynamic, dynamic> map;

  @override
  Widget build(BuildContext context) {
    
    print(map);
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 30,),
            SizedBox(
              //height: 250,
              child: CachedNetworkImage(
                imageUrl:
                map['file'],
                    //'https://m.media-amazon.com/images/I/61r6-XthLML._UL1001_.jpg',
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Text(
                map['title'],
                //'Title: Sleeveless',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
             ),
            const SizedBox(
              height: 10,
            ),
             Text(
              map['description'],
              //' full suits are faster and warmer. In the past, full suits were often only used for very cold swims, as they had a reputation for reducing stroke efficiency and causing muscle fatigue in the arms. With the advent of more flexible materials and better construction techniques, today crop of full suits, even the value ones, feature restriction-free design benefits. Now they have become the choice of suit for most triathletes',
              style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Rs:'+map['price'],
                    //'price:3100',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buy'),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
