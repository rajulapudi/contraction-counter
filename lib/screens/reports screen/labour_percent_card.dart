import 'package:contractions_counter_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LaborPercent extends StatefulWidget {
  @override
  _LaborPercentState createState() => _LaborPercentState();
}

class _LaborPercentState extends State<LaborPercent> {
  double value = 20;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: kSecondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              width: width * 0.5,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: value,
                      color: Colors.greenAccent),
                  GaugeRange(
                      startValue: value, endValue: 100, color: Colors.grey),
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: 20)
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text('${value.toInt()}% chance for Labour',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal))),
                      angle: 90,
                      positionFactor: 1.2)
                ])
              ]),
            ),
     ],
        ),
      ),
    );
  }
}
