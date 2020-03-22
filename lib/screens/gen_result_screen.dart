import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotterynumbergen/data/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';
import 'package:lotterynumbergen/widgets/lotto_grid.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GenResultScreen extends StatelessWidget {
  static String id = 'genresultscreen';  

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Consumer<GenerationDataProvider>(
      builder: (context, model, child) {
        List<int> _myNumbers = _generateNumbers(
          model.getGenerationData().selectedLotteryNumber.numberIdentifier, 
          model.getGenerationData().selectedSystem,
        );

        double boxSize = model.getGenerationData().selectedSystem.systemIdentifier == SupportedSystems.sixOf49 
          ? MediaQuery.of(context).size.width / 18
          : MediaQuery.of(context).size.width / 24;

        Color _boxColor = themeProvider.getTheme() == darkMode 
          ? Colors.black87
          : Colors.black38;
        Color _innerBoxColor = themeProvider.getTheme() == darkMode 
          ? kColorTwo
          : kColorSeven;

        return Scaffold(
          appBar: AppBar(
            title: Text('Result'),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,            
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[                                                
                  Text('You want to play'),
                  Card(                      
                    elevation: 5.0,
                    margin: const EdgeInsets.all(8.0),
                    color: themeProvider.getTheme() == darkMode ? Colors.grey : Colors.grey[300],
                    child: ListTile(
                      leading: Icon(MaterialCommunityIcons.chess_queen),
                        title: Text(
                          model.getGenerationData().selectedSystem.name, style: kHeader1,                          
                      ),
                    ),
                  ),
                  Text('You want'),
                  Card(child: ListTile(
                    leading: Icon(MaterialCommunityIcons.numeric_9_plus_box_multiple_outline),
                    title: Text(model.getGenerationData().selectedLotteryNumber.numberIdentifier.toString(), style: kHeader1,))),
                  Text('numbers',),                  
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 15.0),
                    child: Container(                    
                      height: 1,
                      width: double.infinity,
                      color: themeProvider.getTheme() == darkMode ? kColorOne : kColorThree,
                    ),
                  ),
                  Text('Here are your lucky numbers!', style: kHeader1,),
                  _generateNumbersList(
                    _myNumbers,
                  ),
                  Text(
                    'And your generated fields ...', 
                    style: kSmallBoldText,
                  ),
                  SizedBox(height: 15.0,),
                  Center(
                    child: Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,                                                          
                      children: 
                        _buildAllLottoGrids(boxSize, _boxColor, _innerBoxColor, _myNumbers, model, model.getGenerationData().selectedLotteryField.numberIdentifier,)
                      ,
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

  List<Widget> _buildAllLottoGrids(double boxSize, Color _boxColor, Color _innerBoxColor, List<int> _myNumbers, GenerationDataProvider model, int number) {
    List<Widget> lottoGrids = [];

    for (int i = 0; i < number; i++) {
        lottoGrids.add(_buildOneLottoGrid(boxSize, _boxColor, _innerBoxColor, _myNumbers, model));
    }

    return lottoGrids;
  }

  LottoGrid _buildOneLottoGrid(double boxSize, Color _boxColor, Color _innerBoxColor, List<int> _myNumbers, GenerationDataProvider model) {
    return LottoGrid(
                        boxSize: boxSize,
                        boxColor: _boxColor,
                        innerBoxColor: _innerBoxColor,
                        containedNumbers: _myNumbers, 
                        system: model.getGenerationData().selectedSystem, 
                        boxNumberStyle: kTinyText,
                        selectedBoxNumberStyle: kTinyBoldText,                         
                      );
  }

  List<int> _generateNumbers(int howMany, LotterySystem system) {
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

  Wrap _generateNumbersList(List<int> numberList) {
    return Wrap(      
      spacing: 5.0,
      children: numberList
          .map(
            (singleNumber) => Chip(              
              label: Text(
                '$singleNumber',
                style: kSmallBoldText,
              ),
            ),
          )
          .toList(),
    );
  }
}

