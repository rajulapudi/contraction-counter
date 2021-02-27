import 'package:get/get.dart';

class ContractionsCounter extends GetxController {
  var contractionState = false.obs;
  var start;
  var end;
  var duration;
  var gap;
  var lastEnded;

  RxList<_Contraction> contractionsArray = RxList<_Contraction>();

  void startContraction() {
    print('started contractions');
    contractionState.value = true;
    start = DateTime.now().toUtc();
  }

  void endContraction() {
    contractionState.value = false;
    bool isFirst = contractionsArray.length == 0;
    if (!isFirst) {
      gap = start.difference(lastEnded);
    } else {
      gap = Duration(seconds: 0);
    }
    int indexcount = contractionsArray.length + 1;
    end = DateTime.now().toUtc();
    lastEnded = DateTime.now().toUtc();
    Duration dur = end.difference(start);
    contractionsArray.insert(
        0, _Contraction(indexcount, start, end, dur, gap, isFirst));
    // contractionsArray
    //     .add(_Contraction(indexcount, start, end, dur, gap, isFirst));
    resetEpisodeValues();
    // after each episode of contraction we push an contraction object to list array
  }

  void resetEpisodeValues() {
    start = null;
    end = null;
    duration = null;
    gap = null;
  }

  RxList<_Contraction> getContractionArray() {
    return contractionsArray;
  }
  // List<_Contraction> get getContractionArray => contractionsArray.map((item) => Text('$item')).toList();
}

class _Contraction {
  _Contraction(
      this.count, this.start, this.end, this.duration, this.gap, this.isFirst);
  int count;
  DateTime start;
  DateTime end;
  Duration duration;
  Duration gap;
  bool isFirst;
}

//  record - duration of contraction (mins :: secs), frequency of contraction (counts / ())

// firstContraction
// secondContraction  --> gap from previous Contraction
// ThirdContraction  --> gap from previous Contraction

// start
// end
// duration
// gap

// standard deviation  -> both duration of contractions & gap of contraction

// if standard deviation is less -> true labour
// if standard deviation is more -> false labour

//

// regular contractions ->
