import 'package:flutter/material.dart';
import 'Notifications.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'Deals.dart';
import 'SecondPage.dart';
import 'WishList.dart';
import 'main.dart';

ThemeData appTheme = ThemeData(
  primaryColor: Colors.purple,
  /* Colors.tealAccent,*/
  secondaryHeaderColor: Colors.pinkAccent,
  /* Colors.teal*/
  // fontFamily:
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Universiti Teknologi Malaysia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Skudai, Johor Bahru',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('200'),
    ],
  ),
);

Column buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class Deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The divine law of Allah is the foundation of knowledge. '
        'In line with His Will, UTM strives with total commitment to attain excellence in science, '
        'technology and engineering for the well-being and prosperity of mankind. '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          title: const Text('Rent A Car'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            titleSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
