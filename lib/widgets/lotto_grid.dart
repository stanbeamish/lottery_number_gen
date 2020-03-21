import 'package:flutter/material.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';

class GridUtils {
  static List<int> rowOne = [1, 2, 3, 4, 5, 6, 7];
  static List<int> rowTwo = [8, 9, 10, 11, 12, 13, 14];
  static List<int> rowThree = [15, 16, 17, 18, 19, 20, 21];
  static List<int> rowFour = [22, 23, 24, 25, 26, 27, 28];
  static List<int> rowFive = [29, 30, 31, 32, 33, 34, 35];
  static List<int> rowSix = [36, 37, 38, 39, 40, 41, 42];
  static List<int> rowSeven = [43, 44, 45, 46, 47, 48, 49];

  static List<List<int>> lottoGrid = [
    rowOne,
    rowTwo,
    rowThree,
    rowFour,
    rowFive,
    rowSix,
    rowSeven
  ];
}


class LottoGrid extends StatelessWidget {
  final List<int> containedNumbers;
  final double boxSize;
  final Color boxColor;
  final Color innerBoxColor;

  const LottoGrid({
    @required this.containedNumbers,
    this.boxColor = kColorSix,
    this.innerBoxColor = kColorSeven,
    this.boxSize = 22.0,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: GridUtils.lottoGrid.map((List<int> gridRow) {
          return Row(
            children: gridRow
                .map(
                  (box) => SingleBox(
                    boxColor: boxColor,
                    boxSize: boxSize,
                    boxText: box,
                    containedNumbers: containedNumbers,
                  ),
                )
                .toList(),
          );
        }).toList(),
      ),
    );
  }
}

class SingleBox extends StatelessWidget {
  final int boxText;
  final Color boxColor;
  final double boxSize;
  final Color innerBoxColor;
  final List<int> containedNumbers;

  const SingleBox({
    this.boxText,
    this.boxColor = kColorThree,
    this.innerBoxColor = kColorSeven,
    this.boxSize,
    @required this.containedNumbers
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      color: boxColor,
      child: SizedBox(
        width: boxSize,
        height: boxSize,
        child: Container(
          color: containedNumbers.contains(boxText) ? kColorThree : innerBoxColor,
          child: Center(
            child: Text(              
              boxText.toString(),
              style: containedNumbers.contains(boxText) ? kSmallBoldText : kSmallText,
            ),
          ),
        ),
      ),
    );
  }
}
