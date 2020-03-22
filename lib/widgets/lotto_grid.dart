import 'package:flutter/material.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';

class GridUtils {
  static List<int> of49One = [1, 2, 3, 4, 5, 6, 7];
  static List<int> of49Two = [8, 9, 10, 11, 12, 13, 14];
  static List<int> of49Three = [15, 16, 17, 18, 19, 20, 21];
  static List<int> of49Four = [22, 23, 24, 25, 26, 27, 28];
  static List<int> of49Five = [29, 30, 31, 32, 33, 34, 35];
  static List<int> of49Six = [36, 37, 38, 39, 40, 41, 42];
  static List<int> of49Seven = [43, 44, 45, 46, 47, 48, 49];

  static List<int> ejOne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  static List<int> ejTwo = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  static List<int> ejThree = [21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
  static List<int> ejFour = [31, 32, 33, 34, 35, 36, 37, 38, 39, 40];
  static List<int> ejFive = [41, 42, 43, 44, 45, 46, 47, 48, 49, 50];

  static List<List<int>> lottoGridOf49 = [
    of49One,
    of49Two,
    of49Three,
    of49Four,
    of49Five,
    of49Six,
    of49Seven
  ];

  static List<List<int>> lottoGridEuroJackpot = [
    ejOne,
    ejTwo,
    ejThree,
    ejFour,
    ejFive
  ];

  static List<int> lottoEuro2Of10Grid = ejOne;
}

class LottoGrid extends StatelessWidget {
  final List<int> containedNumbers;
  final double boxSize;
  final Color boxColor;
  final Color innerBoxColor;
  final TextStyle boxNumberStyle;
  final TextStyle selectedBoxNumberStyle;
  final LotterySystem system;
  final bool isEuroJackpotExtraGrid;

  const LottoGrid({
    @required this.containedNumbers,
    this.boxColor = kColorSix,
    this.innerBoxColor = kColorSeven,
    this.boxSize = 22.0,
    this.boxNumberStyle,
    this.selectedBoxNumberStyle,
    @required this.system,
    this.isEuroJackpotExtraGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    List<List<int>> currentSystemGrid;

    switch (system.systemIdentifier) {
      case SupportedSystems.sixOf49:
        currentSystemGrid = GridUtils.lottoGridOf49;
        break;
      case SupportedSystems.euroJackpot:
        currentSystemGrid = GridUtils.lottoGridEuroJackpot;
        break;
    }

    if (isEuroJackpotExtraGrid) {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 2.0,
            ),
            Text('2 of 10', style: kTinyText),
            SizedBox(
              height: 4.0,
            ),
            Wrap(
              children: GridUtils.lottoEuro2Of10Grid
                  .map(
                    (box) => SingleBox(
                      boxColor: boxColor,
                      boxSize: boxSize,
                      boxText: box,
                      containedNumbers: containedNumbers,
                      numberStyle: boxNumberStyle,
                      selectedNumberStyle: selectedBoxNumberStyle,
                      innerBoxColor: innerBoxColor,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: currentSystemGrid.map(
          (List<int> gridRow) {
            return Wrap(
              children: gridRow
                  .map(
                    (box) => SingleBox(
                      boxColor: boxColor,
                      boxSize: boxSize,
                      boxText: box,
                      containedNumbers: containedNumbers,
                      numberStyle: boxNumberStyle,
                      selectedNumberStyle: selectedBoxNumberStyle,
                      innerBoxColor: innerBoxColor,
                    ),
                  )
                  .toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}

class SingleBox extends StatelessWidget {
  final int boxText;
  final Color boxColor;
  final double boxSize;
  final Color innerBoxColor;
  final TextStyle selectedNumberStyle;
  final TextStyle numberStyle;
  final List<int> containedNumbers;

  const SingleBox(
      {this.boxText,
      this.boxColor = kColorThree,
      this.innerBoxColor = kColorSeven,
      this.boxSize,
      this.numberStyle = kSmallText,
      this.selectedNumberStyle = kSmallBoldText,
      @required this.containedNumbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      color: boxColor,
      child: SizedBox(
        width: boxSize,
        height: boxSize,
        child: Container(
          color:
              containedNumbers.contains(boxText) ? kColorThree : innerBoxColor,
          child: Center(
            child: Text(
              boxText.toString(),
              style: containedNumbers.contains(boxText)
                  ? selectedNumberStyle
                  : numberStyle,
            ),
          ),
        ),
      ),
    );
  }
}
