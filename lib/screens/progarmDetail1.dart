import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';
import 'login.dart';

class ProgramDetail1 extends StatelessWidget {
  const ProgramDetail1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var dbclass = context.read<DataBase>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competition'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                imageUrl: 'https://jansherjr.com/img/competition.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'How it\'s Work',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                      color: Theme.of(context).primaryColor),
                  softWrap: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle.svg'),
                      ),
                    ),
                    Text(
                      'FITNESS ASSESSMENT',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'ONCE THE PAYMENT IS PROCESSED YOU WILL RECEIVE AN EMAIL WITH A QUESTIONNAIRE FROM ME. ANSWER HONESTLY AND PROVIDE AS MUCH DETAIL AS YOU CAN. YOUR ANSWERS WILL HELP ME BUILD THE BEST CUSTOM PLAN FOR YOUR GOALS AND YOUR BODY\'S NEEDS.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle2.svg'),
                      ),
                    ),
                    Text(
                      'GETTING STARTED',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'ONCE YOU RECEIVE YOUR PROGRAM, IT IS EXPECTED THAT YOU WILL BEGIN WITHIN 48 HOURS. IF YOU HAVE ANY QUESTIONS OR NEED ASSISTANCE GETTING STARTED, SUPPORT IS ALWAYS AVAILABLE VIA EMAIL. YOU WILL ALSO GET MY PHONE NUMBER TO HAVE 24*7 COMMUNICATION WITH ME',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle3.svg'),
                      ),
                    ),
                    Text(
                      'CUSTOM PROGRAM',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'THE INFORMATION FROM THE QUESTIONNAIRE WILL BE USED TO GATHER ALL INFORMATION NEEDED TO CREATE YOUR CUSTOM PROGRAM INCLUDING PHYSIQUE STATS, HEALTH HISTORY, CURRENT HEALTH STATUS, INJURIES YOU MAY HAVE (IF ANY), YOUR CURRENT EATING/EXERCISE HABITS,ANY FOOD ALLERGIES',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle4.svg'),
                      ),
                    ),
                    Text(
                      'WEEKLY CHECK-INS',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'CHECK-INS ARE TO BE MADE WEEKLY ON THE DAY STATED IN YOUR PROGRAM.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle5.svg'),
                      ),
                    ),
                    Text(
                      'PHOTO ASSESSMENT',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'YOU WILL ALSO BE REQUIRED TO SUBMIT CURRENT PICTURES OF YOURSELF. ONCE THE QUESTIONNAIRE IS COMPLETED AND RETURNED, YOUR PROGRAM WILL THEN BE PREPARED AND DELIVERED TO YOU VIA EMAIL WITHIN 6 BUSINESS DAYS. (USUALLY SOONER',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset('assets/icons/muscle6.svg'),
                      ),
                    ),
                    Text(
                      'ADJUSTMENTS',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                      softWrap: true,
                    ),
                    Text(
                      'YOUR CUSTOM PROGRAM WILL BE CHANGED/ADJUSTED AT LEAST BI-WEEKLY DEPENDING ON YOUR PROGRESS AND GOALS.',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Theme.of(context).secondaryHeaderColor),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'JANSHER\'S PERSONALIZED COMPETITION COACHING PROGRAM',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor),
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Fitness Competition Prep: A Competition Program For Those Wanting To Compete In An Upcoming Fitness Competition. Do you want to get the competitive edge and feel ready for your next fitness competition? Join us for a series of workouts, nutrition coaching, and mental preparation classes to help you reach your goals! There will be custom programming for every level of ability so that everyone can be successful in achieving their goals.',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Theme.of(context).secondaryHeaderColor),
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Consumer<DataBase>(builder: (context, value, child) {
              return Center(
              child: 
              dbclass.islog==true ?
              Text(''):
              ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, Register());
                },
                child: const Text('Enroll Now'),
              )
            );
            const SizedBox(
              height: 15.0,
            );})
          ],
        ),
      ),
    );
  }
}
