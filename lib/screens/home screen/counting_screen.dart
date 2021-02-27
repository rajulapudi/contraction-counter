/// Dart imports
import 'dart:async';
import 'dart:math' as math;
import 'package:contractions_counter_flutter/controllers/contraction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:contractions_counter_flutter/constants.dart';

class CountingScreen extends StatefulWidget {
  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  Timer timer;
  List<_ChartData> chartData = <_ChartData>[
    _ChartData(1, 0),
  ];
  int count = 1;
  ChartSeriesController _chartSeriesController;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContractionsCounter counter = Get.put(ContractionsCounter());
    return Column(
      children: [
        Container(height: 200, child: _getLiveLineChart()),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Obx(() => DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Contractions',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Duration',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Interval',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: counter.contractionsArray
                        .map((contraction) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(contraction.count.toString())),
                                DataCell(Text(
                                    contraction.duration.inSeconds.toString())),
                                contraction.isFirst
                                    ? DataCell(Text('First Contraction'))
                                    : DataCell(Text(
                                        contraction.gap.inSeconds.toString())),
                              ],
                            ))
                        .toList(),
                  )),
            ),
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: kSecondaryColor,
          ),
          child: Obx(() => Center(
              child: counter.contractionState.value
                  ? RaisedButton(
                      onPressed: () => counter.endContraction(),
                      child: Text('Stop Contractions'),
                    )
                  : RaisedButton(
                      onPressed: () {
                        counter.startContraction();
                        timer = Timer.periodic(
                            const Duration(milliseconds: 1000),
                            _updateDataSource);
                      },
                      child: Text('Start Contractions'),
                    ))),
        )
      ],
    );
  }

  SfCartesianChart _getLiveLineChart() {
    return SfCartesianChart(plotAreaBorderWidth: 0,
        // primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        // primaryYAxis: NumericAxis(
        //     axisLine: AxisLine(width: 0),
        //     majorTickLines: MajorTickLines(size: 0)),
        series: <LineSeries<_ChartData, int>>[
          LineSeries<_ChartData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (_ChartData sales, _) => sales.elapsedTime,
            yValueMapper: (_ChartData sales, _) => sales.contractionStrength,
            animationDuration: 0,
          )
        ]);
  }

  ///Continously updating the data source based on timer
  void _updateDataSource(Timer timer) {
    chartData.add(_ChartData(count, _getRandomInt(2, 5)));
    if (false) {
      // if (chartData.length == 200) {
      chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
      );
    }
    count = count + 1;
  }

  ///Get the random data
  num _getRandomInt(num min, num max) {
    final ContractionsCounter count = Get.find();
    final math.Random _random = math.Random();
    if (count.contractionState.value) {
      return min + _random.nextInt(max - min);
    }
    return 0;
  }
}

// class EpisodeUi extends StatelessWidget {
//   final int count;
//   final Duration dur;
//   final Duration gap;
//   final bool isFirst;

//   EpisodeUi(
//       {@required this.count,
//       @required this.dur,
//       @required this.gap,
//       @required this.isFirst});
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }

class _ChartData {
  _ChartData(this.elapsedTime, this.contractionStrength);
  final num elapsedTime;
  final num contractionStrength;
}
