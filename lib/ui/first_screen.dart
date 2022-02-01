import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kenye_app/ui/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const name = 'first-screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, HomePage.name));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.pngall.com/wp-content/uploads/2016/06/Kanye-West.png',
            fit: BoxFit.contain,
            width: 200,
          ),
        ],
      ),
    );
  }
}
