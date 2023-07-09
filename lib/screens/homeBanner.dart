import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/jr11.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white10,
                  Colors.black87,
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Welcome to JR Coaching App.',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ))
        ],
      ),
    );
  }
}
