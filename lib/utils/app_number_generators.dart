import 'dart:math';
import 'package:lotterynumbergen/models/lottery_system.dart';

class NumberGeneratorsUtils {
  static List<int> generateNumbers(int howMany, LotterySystem system) {
    List<int> results = <int>[];
    int max = system.maxNumber;

    for (int i = 0; i < howMany; i++) {
      int a = _getRandomNumber(max);

      if (results.contains(a)) {
        i--;
      } else {
        results.add(a);
      }
    }

    results.sort();

    return results;
  }

  static List<int> generateEuroJackpotExtras() {
    List<int> results = <int>[];

    for (int i = 0; i < 2; i++) {
      int a = _getRandomNumber(10);

      if (results.contains(a)) {
        i--;
      } else {
        results.add(a);
      }
    }

    return results;
  }

  static int _getRandomNumber(int max) {
    var r = Random();
    int a = r.nextInt(max - 1) + 1;
    return a;
  }
}
