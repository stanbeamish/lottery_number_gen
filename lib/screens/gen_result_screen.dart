import 'package:flutter/material.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_number_generators.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';
import 'package:lotterynumbergen/utils/app_text_utils.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';
import 'package:lotterynumbergen/widgets/lotto_grid.dart';
import 'package:provider/provider.dart';
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
                ? MediaQuery.of(context).size.width / 18
                : MediaQuery.of(context).size.width / 24;
        
        int numberOfFields = model.getGenerationData().selectedLotteryField.numberIdentifier;

        if (numberOfFields < 2) {
          boxSize = boxSize * 1.5;
        } else if (numberOfFields == 2) {
          boxSize = boxSize * 1.1;
        }

        bool isDarkMode = currentTheme == darkMode;

        Color _boxColor = isDarkMode ? Colors.black87 : Colors.black38;
        Color _innerBoxColor = isDarkMode ? kColorTwo : kColorSeven;

        return Scaffold(
          appBar: AppBar(
            title: Text(
                AppTextUtils.getUIText(context, 'genresults_screen_title')),
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
                      context, 'genresults_screen_wantplay')),
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
                      context, 'genresults_screen_youwant')),
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
                        context, 'genresults_screen_numbers'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 15.0),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: themeProvider.getTheme() == darkMode
                          ? kColorOne
                          : kColorThree,
                    ),
                  ),
                  Text(
                    AppTextUtils.getUIText(
                        context, 'genresults_screen_hereareluckynumbers'),
                    style: kHeader1,
                  ),
                  _generateNumbersList(
                    _myNumbers,
                    isDarkMode,
                  ),
                  Text(
                    AppTextUtils.getUIText(
                        context, 'genresults_screen_andgeneratedfields'),
                    style: kSmallBoldText,
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
      double boxSize,
      Color _boxColor,
      Color _innerBoxColor,
      List<int> _myNumbers,
      GenerationDataProvider model,
      dynamic currentTheme,
      int number) {
    List<Widget> lottoGrids = [];

    for (int i = 0; i < number; i++) {
      lottoGrids.add(_buildOneLottoGrid(
          boxSize, _boxColor, _innerBoxColor, _myNumbers, model, currentTheme));
    }

    return lottoGrids;
  }

  Widget _buildOneLottoGrid(double boxSize, Color boxColor, Color innerBoxColor,
      List<int> myNumbers, GenerationDataProvider model, dynamic currentTheme) {        
    List<int> _extraNumbers = NumberGeneratorsUtils.generateEuroJackpotExtras();

    return Column(
      children: <Widget>[
        LottoGrid(
          boxSize: boxSize,
          boxColor: boxColor,
          innerBoxColor: innerBoxColor,
          containedNumbers: myNumbers,
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

  LottoGrid _buildEuroJackpotExtraGrid(double boxSize, Color boxColor,
      Color innerBoxColor, List<int> extraNumbers) {
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
      spacing: 3.0,
      runSpacing: 5.0,
      children: numberList
          .map(
            (singleNumber) => Chip(
              elevation: 4.0,
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              backgroundColor: isDarkMode ? kColorThreeDark : kColorOne,
              label: Text(
                '$singleNumber',
                overflow: TextOverflow.ellipsis,
                style: kSmallBoldText,
              ),
            ),
          )
          .toList(),
    );
  }
}
