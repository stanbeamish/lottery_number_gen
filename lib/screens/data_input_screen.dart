import 'package:flutter/material.dart';
import 'package:lotterynumbergen/models/lottery_field.dart';
import 'package:lotterynumbergen/models/lottery_number.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/screens/gen_result_screen.dart';
import 'package:lotterynumbergen/screens/settings_screen.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
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
  LotterySystem? _lotSystem = supportedLotterySystems[0];
  LotteryField? _lotField = supportedLotteryFields[0];
  late GenerationData generationData;

  next(List<Step> steps) {
    if (_currentStep == 1) {
      // must set this value to the provider
      setState(() {
        generationData.selectedLotteryNumber = supportedLotteryNumbers
            .firstWhere((element) => element.numberIdentifier == _numCnt);
      });
    }
    _currentStep + 1 != steps.length
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
      setState(() {
        _complete = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_1_title')!,
        ),
        content: _buildLottoSystemSelection(),
        state: _currentStep == 0 ? StepState.indexed : StepState.complete,
        subtitle: Text(
          AppTextUtils.getUIText(context, 'start_screen_1_text')!,
        ),
      ),
      Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_2_title')!,
        ),
        content: _buildLotteryNumberSlider(context),
        state: (_currentStep > 1) ? StepState.complete : StepState.indexed,
        subtitle: Text(
          AppTextUtils.getUIText(context, 'start_screen_2_text')!,
        ),
      ),
      Step(
        title: Text(
          AppTextUtils.getUIText(context, 'start_screen_3_title')!,
        ),
        content: _buildLotteryFieldSelection(_numCnt.toInt()),
        state: (_currentStep > 2 || _complete == true)
            ? StepState.complete
            : StepState.indexed,
        subtitle: Text(
          AppTextUtils.getUIText(context, 'start_screen_3_text')!,
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTextUtils.getUIText(context, 'start_screen_title')!),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.id);
            },
            child: Icon(
              Icons.settings,
              size: 28.0,
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Stepper(
              steps: steps,
              currentStep: _currentStep,
              onStepContinue: () => next(steps),
              onStepCancel: cancel,
              //onStepTapped: (step) => goTo(step),
            ),
          ),
          _complete ? _buildGenerateButton() : Container()
        ],
      ),
    );
  }

  Widget _buildLottoSystemSelection() {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);
    generationData = generationDataProvider.getGenerationData();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: supportedLotterySystems.map((system) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 4.0),
                  child: Text(
                    system.name,
                  ),
                ),
                Radio(
                  value: system,
                  groupValue: _lotSystem,
                  onChanged: (dynamic value) {
                    setState(() {
                      _lotSystem = value;
                      generationData.selectedSystem = _lotSystem;
                      if (_lotSystem!.minGeneratedNumbers > _numCnt) {
                        _numCnt = 8;
                      }
                      generationData.selectedLotteryNumber =
                          supportedLotteryNumbers.firstWhere((element) =>
                              element.numberIdentifier ==
                              _lotSystem!.minGeneratedNumbers);
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLotteryNumberSlider(BuildContext context) {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);

    generationData = generationDataProvider.getGenerationData();
    int minGenNum = generationData.selectedSystem!.minGeneratedNumbers;
    int maxGenNum = generationData.selectedSystem!.maxGeneratedNumbers;

    return Column(
      children: <Widget>[
        Card(
          elevation: 5.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                _numCnt.toInt().toString(),
                style: kHeader1,
              ),
            ),
          ),
        ),
        Slider(
          value: _numCnt,
          onChanged: (newNumCnt) {
            setState(() {
              _numCnt = newNumCnt;
              generationData.selectedLotteryNumber = supportedLotteryNumbers
                  .firstWhere((element) => element.numberIdentifier == _numCnt);
            });
          },
          divisions: (maxGenNum - minGenNum),
          min: minGenNum.toDouble(),
          max: maxGenNum.toDouble(),
          //label: '${_numCnt.toInt()}',
          inactiveColor: kColorSix.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget _buildLotteryFieldSelection(int numberOfLuckyNumbers) {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);
    generationData = generationDataProvider.getGenerationData();

    late List<LotteryField> _numberFieldsDependendOnLuckyNumbers;

    switch (numberOfLuckyNumbers) {
      case 5:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(0, 1).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            // not available
          }
        }
        break;

      case 6:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(1, 3).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(0, 1).toList();
          }
        }
        break;

      case 7:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(2, 6).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(1, 3).toList();
          }
        }
        break;

      case 8:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(3, 8).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(2, 6).toList();
          }
        }
        break;

      case 9:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(5, 8).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(4, 8).toList();
          }
        }
        break;

      case 10:
        {
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.euroJackpot) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(6, 8).toList();
          }
          if (generationData.selectedSystem!.systemIdentifier ==
              SupportedSystems.sixOf49) {
            _numberFieldsDependendOnLuckyNumbers =
                supportedLotteryFields.getRange(5, 8).toList();
          }
        }
        break;
    }

    return Center(
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 8.0,
        children: _numberFieldsDependendOnLuckyNumbers.map((field) {
          return Column(
            children: <Widget>[
              Text(
                field.numberIdentifier.toString(),
                style: kSmallBoldText,
              ),
              Radio(
                value: field,
                groupValue: _lotField,
                onChanged: (dynamic value) {
                  setState(() {
                    _lotField = value;
                    generationData.selectedLotteryField = _lotField;
                  });
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, GenResultScreen.id);
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppTextUtils.getUIText(context, 'start_screen_btn_generate')!,
                  style: kButtonText,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
