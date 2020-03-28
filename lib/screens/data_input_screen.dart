import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lotterynumbergen/models/lottery_field.dart';
import 'package:lotterynumbergen/models/lottery_number.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/screens/settings_screen.dart';
import 'package:lotterynumbergen/utils/app_styles.dart';
import 'package:lotterynumbergen/utils/app_text_utils.dart';
import 'package:provider/provider.dart';

class DataInputScreen extends StatefulWidget {
  static String id = 'datainputscreen';
  @override
  _DataInputScreenState createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  // variables for the Stepper widget
  int _currentStep = 0;
  bool _complete = false;  

  double _numCnt = 7.0;
  LotterySystem _lotSystem = supportedLotterySystems[0];
  LotteryField _lotField = supportedLotteryFields[0];
  GenerationData generationData;

  next(List<Step> steps) {
    _currentStep +1 != steps.length
    ? goTo(_currentStep + 1)
    : setState(() => _complete = true);
  }

  goTo(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
    Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_1_title'),          
        ), 
        content: _buildLottoSystemSelection(),
        state: _currentStep == 0 ? StepState.indexed : StepState.complete,
        subtitle: Text(AppTextUtils.getUIText(context, 'start_screen_1_text'),),        
      ),
      Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_2_title'),
        ),
        content: Container(),
        state: (_currentStep > 1) ? StepState.complete : StepState.indexed,
        subtitle: Text(AppTextUtils.getUIText(context, 'start_screen_2_text'),),
      ),
      Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_3_title'),
        ),
        content: Container(),
        state: (_currentStep > 2 || _complete == true) ? StepState.complete : StepState.indexed,
        subtitle: Text(AppTextUtils.getUIText(context, 'start_screen_3_text'),),
      )
    ];   

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTextUtils.getUIText(context, 'start_screen_title')),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.id);
            },
            child: Icon(
              MaterialCommunityIcons.cogs,
              size: 28.0,
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Container(
        child: Stepper(
          steps: steps,                  
          currentStep: _currentStep,
          onStepContinue: () => next(steps),
          onStepCancel: cancel,
          //onStepTapped: (step) => goTo(step),
        ),
      ),
    );
  }

  Widget _buildLottoSystemSelection() {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);
    generationData = generationDataProvider.getGenerationData();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,      
      children: supportedLotterySystems.map((system) {
        return Column(          
          children: <Widget>[
            Text(
              system.name,
            ),
            Radio(
              value: system,
              groupValue: _lotSystem,
              onChanged: (value) {
                setState(() {
                  _lotSystem = value;
                  generationData.selectedSystem = _lotSystem;
                  if (_lotSystem.minGeneratedNumbers > _numCnt) {
                    _numCnt = 8;
                  }
                  generationData.selectedLotteryNumber =
                      supportedLotteryNumbers.firstWhere((element) =>
                          element.numberIdentifier ==
                          _lotSystem.minGeneratedNumbers);
                });
              },
            ),            
          ],
        );
      }).toList(),      
    );
  }
}