import 'package:contractions_counter_flutter/components/stats_card.dart';
import 'package:contractions_counter_flutter/screens/reports%20screen/frequency_cart.dart';
import 'package:contractions_counter_flutter/screens/reports%20screen/labour_percent_card.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FrequencyChart(),
          LaborPercent(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
              child: StatsCard(
                description: 'avg duration of each contraction',
                stat: 3,
                units: 'mins',
              ),
            ),
            Expanded(
              child: StatsCard(
                description: 'frequency of contractions per hour',
                stat: 5,
                units: 'contractions',
              ),
            )
          ])
        ],
      ),
    );
  }
}
