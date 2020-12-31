import 'package:flutter/material.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';

class GridUtils {
  static List<List<int>> lottoGridOf49 = [
    List<int>.generate(7, (i) => i + 1),
    List<int>.generate(7, (i) => i + 8),
    List<int>.generate(7, (i) => i + 15),
    List<int>.generate(7, (i) => i + 22),
    List<int>.generate(7, (i) => i + 29),
    List<int>.generate(7, (i) => i + 36),
    List<int>.generate(7, (i) => i + 49),
  ];

  static List<List<int>> lottoGridEuroJackpot = [
    List<int>.generate(10, (i) => i + 1),
    List<int>.generate(10, (i) => i + 11),
    List<int>.generate(10, (i) => i + 21),
    List<int>.generate(10, (i) => i + 31),
    List<int>.generate(10, (i) => i + 41),
  ];

  static List<int> lottoEuro2Of10Grid = List<int>.generate(10, (i) => i + 1);
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

  const SingleBox({
    this.boxText,
    this.boxColor = kColorThree,
    this.innerBoxColor = kColorSeven,
    this.boxSize,
    this.numberStyle = kSmallText,
    this.selectedNumberStyle = kSmallBoldText,
    @required this.containedNumbers,
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
