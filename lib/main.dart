import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenye_app/locator.dart';
import 'package:kenye_app/ui/first_screen.dart';
import 'package:kenye_app/ui/home_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kanye once said",
      theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: FirstScreen.name,
      routes: {
        HomePage.name: (_) => const HomePage(),
        FirstScreen.name: (_) => const FirstScreen(),
      },
    );
  }
}
