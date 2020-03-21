import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotterynumbergen/data/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';
import 'package:lotterynumbergen/widgets/lotto_grid.dart';
import 'package:provider/provider.dart';

class GenResultScreen extends StatelessWidget {
  static String id = 'genresultscreen';

  @override
  Widget build(BuildContext context) {    
    return Consumer<GenerationDataProvider>(
      builder: (context, model, child) {
        List<int> _myNumbers = _generateNumbers(
          model.getGenerationData().selectedLotteryNumber.numberIdentifier, 
          model.getGenerationData().selectedSystem,
        );

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
                  Text(model.getGenerationData().selectedSystem.name, style: kHeader1,),
                  Text('You want'),
                  Text(model.getGenerationData().selectedLotteryNumber.numberIdentifier.toString(), style: kHeader1,),
                  Text('numbers',),
                  Text('So, here they are ...', style: kHeader1,),
                  _generateNumbersList(
                    _myNumbers,
                  ),
                  Text(
                    'You want to play ${model.getGenerationData().selectedLotteryField.numberIdentifier.toString()} fields ...', 
                    style: kSmallBoldText,
                  ),
                  SizedBox(height: 15.0,),
                  Wrap(
                    spacing: 10.0,                                
                    runSpacing: 10.0,                        
                    children: <Widget>[
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),
                      LottoGrid(boxSize: 22, containedNumbers: _myNumbers,),                      
                    ],
                  ),                
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<int> _generateNumbers(int howMany, LotterySystem system) {
    List<int> results = List<int>();
    var r = Random();
    int max = system.systemIdentifier == SupportedSystems.sixOf49 ? 49 : 50;

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

