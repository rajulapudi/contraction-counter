import 'package:contractions_counter_flutter/constants.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final double stat;
  final String description;
  final String units;
  StatsCard(
      {@required this.stat, @required this.description, @required this.units});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: kSecondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$stat',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 50.0,
              ),
            ),
            Text(units, style: TextStyle(color: kPrimaryColor)),
            SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
