import 'package:flutter/material.dart';
import 'package:lotterynumbergen/models/lottery_distribution.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_number_generators.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';
import 'package:lotterynumbergen/utils/app_text_utils.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';
import 'package:lotterynumbergen/widgets/line_separator.dart';
import 'package:lotterynumbergen/widgets/lotto_grid.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

class GenResultScreen extends StatelessWidget {
  static String id = 'genresultscreen';

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    var currentTheme = themeProvider.getTheme();

    return Consumer<GenerationDataProvider>(
      builder: (context, model, child) {
        List<int> _myNumbers = NumberGeneratorsUtils.generateNumbers(
          model.getGenerationData().selectedLotteryNumber.numberIdentifier,
          model.getGenerationData().selectedSystem,
        );

        double boxSize =
            model.getGenerationData().selectedSystem.systemIdentifier ==
                    SupportedSystems.sixOf49
                ? MediaQuery.of(context).size.width / 14
                : MediaQuery.of(context).size.width / 17;

        int numberOfFields =
            model.getGenerationData().selectedLotteryField.numberIdentifier;

        if (numberOfFields < 2) {
          boxSize = boxSize * 1.3;
        } else if (numberOfFields == 2) {
          boxSize = boxSize * 1.1;
        }

        bool isDarkMode = currentTheme == darkMode;

        Color _boxColor = isDarkMode ? Colors.black26 : Colors.black38;
        Color _innerBoxColor = isDarkMode ? kColorTwo : kColorSeven;

        return Scaffold(
          appBar: AppBar(
            title: Text(
                AppTextUtils.getUIText(context, 'genresults_screen_title')!),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(AppTextUtils.getUIText(
                      context, 'genresults_screen_wantplay')!),
                  Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.all(8.0),
                    color: themeProvider.getTheme() == darkMode
                        ? Colors.grey
                        : Colors.grey[300],
                    child: ListTile(
                      leading: Icon(MaterialCommunityIcons.chess_queen),
                      title: Text(
                        model.getGenerationData().selectedSystem.name,
                        style: kHeader1,
                      ),
                    ),
                  ),
                  Text(AppTextUtils.getUIText(
                      context, 'genresults_screen_youwant')!),
                  Card(
                      child: ListTile(
                          leading: Icon(MaterialCommunityIcons
                              .numeric_9_plus_box_multiple_outline),
                          title: Text(
                            model
                                .getGenerationData()
                                .selectedLotteryNumber
                                .numberIdentifier
                                .toString(),
                            style: kHeader1,
                          ))),
                  Text(
                    AppTextUtils.getUIText(
                        context, 'genresults_screen_numbers')!,
                  ),
                  LineSeparator(themeProvider: themeProvider),
                  Text(
                    AppTextUtils.getUIText(
                      context,
                      'genresults_screen_hereareluckynumbers',
                    )!,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  _generateNumbersList(
                    _myNumbers,
                    isDarkMode,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  LineSeparator(themeProvider: themeProvider),
                  Text(
                    AppTextUtils.getUIText(
                        context, 'genresults_screen_andgeneratedfields')!,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      children: _buildAllLottoGrids(
                        boxSize,
                        _boxColor,
                        _innerBoxColor,
                        _myNumbers,
                        model,
                        currentTheme,
                        model
                            .getGenerationData()
                            .selectedLotteryField
                            .numberIdentifier,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildAllLottoGrids(
      double _boxSize,
      Color _boxColor,
      Color _innerBoxColor,
      List<int> _myNumbers,
      GenerationDataProvider _model,
      dynamic _currentTheme,
      int _howManyFields) {
    List<Widget> lottoGrids = [];

    int _howManyNumbers = _myNumbers.length;
    List<List<int>> _whichDistribution = [];

    if (_model.getGenerationData().selectedSystem.systemIdentifier ==
        SupportedSystems.euroJackpot) {
      _whichDistribution =
          PlayedSystem.getDistributionEJ(_howManyFields, _howManyNumbers);
    } else if (_model.getGenerationData().selectedSystem.systemIdentifier ==
        SupportedSystems.sixOf49) {
      _whichDistribution =
          PlayedSystem.getDistribution649(_howManyFields, _howManyNumbers);
    }

    for (int i = 0; i < _howManyFields; i++) {
      lottoGrids.add(
        _buildOneLottoGrid(
          _boxSize,
          _boxColor,
          _innerBoxColor,
          _myNumbers,
          _model,
          _currentTheme,
          _whichDistribution,
          i,
        ),
      );
    }

    return lottoGrids;
  }

  Widget _buildOneLottoGrid(
      double boxSize,
      Color boxColor,
      Color innerBoxColor,
      List<int> myNumbers,
      GenerationDataProvider model,
      dynamic currentTheme,
      List<List<int>> whichDistribution,
      int currentFieldNumber) {
    List<int> _extraNumbers = NumberGeneratorsUtils.generateEuroJackpotExtras();

    List<int> currentField = whichDistribution[currentFieldNumber];
    List<int> currentFieldsNumbers = [];

    for (int i = 0; i < currentField.length; i++) {
      int f = currentField[i];

      if (f == 1) {
        currentFieldsNumbers.add(myNumbers[i]);
      }
    }

    return Column(
      children: <Widget>[
        LottoGrid(
          boxSize: boxSize,
          boxColor: boxColor,
          innerBoxColor: innerBoxColor,
          containedNumbers: currentFieldsNumbers,
          system: model.getGenerationData().selectedSystem,
          boxNumberStyle: kTinyText,
          selectedBoxNumberStyle: kTinyBoldText,
        ),
        model.getGenerationData().selectedSystem.systemIdentifier ==
                SupportedSystems.euroJackpot
            ? _buildEuroJackpotExtraGrid(
                boxSize,
                currentTheme == darkMode ? kColorThreeDark : Colors.grey[600],
                currentTheme == darkMode ? innerBoxColor : Colors.yellow[300],
                _extraNumbers)
            : SizedBox(height: 0),
      ],
    );
  }

  LottoGrid _buildEuroJackpotExtraGrid(double boxSize, Color? boxColor,
      Color? innerBoxColor, List<int> extraNumbers) {
    return LottoGrid(
      boxSize: boxSize,
      boxColor: boxColor,
      innerBoxColor: innerBoxColor,
      containedNumbers: extraNumbers,
      system: supportedLotterySystems[0],
      boxNumberStyle: kTinyItalicText,
      selectedBoxNumberStyle: kTinyBoldText,
      isEuroJackpotExtraGrid: true,
    );
  }

  Wrap _generateNumbersList(List<int> numberList, bool isDarkMode) {
    return Wrap(
      spacing: 7.0,
      runSpacing: 7.0,
      children: numberList
          .map(
            (singleNumber) => Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(10.0),
              //shape: CircleBorder(),
              color: isDarkMode ? kColorThreeDark : kColorOne,
              child: Center(
                child: Text(
                  '$singleNumber',
                  overflow: TextOverflow.ellipsis,
                  style: kSmallBoldText,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
