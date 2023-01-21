import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jr/screens/widgets/customAppBar.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: CarouselSlider(
        items: [
          //1st Image of Slider
          Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: NetworkImage("https://jansherjr.com/img/jr11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2nd Image of Slider
          Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: NetworkImage("https://jansherjr.com/img/jr11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //3rd Image of Slider
          Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: NetworkImage("https://jansherjr.com/img/jr11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //4th Image of Slider
          Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: NetworkImage("https://jansherjr.com/img/jr11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //5th Image of Slider
          Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: NetworkImage("https://jansherjr.com/img/jr11.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],

        //Slider Container properties
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
