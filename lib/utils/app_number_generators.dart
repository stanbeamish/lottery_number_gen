import 'dart:math';
import 'package:lotterynumbergen/models/lottery_system.dart';

class NumberGeneratorsUtils {
  static List<int> generateNumbers(int howMany, LotterySystem system) {
    List<int> results = List<int>();
    var r = Random();
    int max = system.maxNumber;

    for (int i = 0; i < howMany; i++) {
      int a = r.nextInt(max - 1) + 1;
      if (results.contains(a)) {
        i--;
      } else {
        results.add(a);
      }
    }

    results.sort();

    return results;
  }
}
