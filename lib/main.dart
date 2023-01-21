import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'models/database.dart';
import 'routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DataBase(),
            builder: (context, child) {
              return MaterialApp(
                title: 'Jansher JR',
                initialRoute: RouteManager.splashPage,
                onGenerateRoute: RouteManager.generateRoute,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFFA0260D),
                    primary: const Color(0xFFA0260D), //<-- SEE HERE
                  ),

                  backgroundColor: const Color(0xFF000000),
                  primaryColor: const Color(0xFFA0260D),
                  secondaryHeaderColor: const Color(0xFFeeeeee),
                  // accentColor: const Color(0xFFFE9936),
                  accentColor: const Color(0xFF4d4949),
                  textTheme: TextTheme(
                    headline1: const TextStyle(
                      color: Color(0xFF4d4949),
                    ),
                    bodyText1: TextStyle(
                      color: const Color(0xFF4d4949).withOpacity(0.5),
                    ),
                  ),
                  primaryTextTheme: GoogleFonts.montserratTextTheme(),
                ),
              );
            }),
      ],
    );
  }
}
