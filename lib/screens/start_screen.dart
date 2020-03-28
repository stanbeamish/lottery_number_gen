import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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

class StartScreen extends StatefulWidget {
  static String id = 'startscreen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _numCnt = 7.0;
  LotterySystem _lotSystem = supportedLotterySystems[0];
  LotteryField _lotField = supportedLotteryFields[0];
  GenerationData generationData;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppTextUtils.getUIText(context, 'start_screen_1_text'),
                  style: kHeader1,
                ),
                SizedBox(
                  height: 6.0,
                ),
                _buildLottoSystemSelection(),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  AppTextUtils.getUIText(context, 'start_screen_2_text'),
                  style: kHeader1,
                ),
                SizedBox(
                  height: 10.0,
                ),
                //_buildLotteryNumbersSelection(),
                _buildLotteryNumberSlider(context),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  AppTextUtils.getUIText(context, 'start_screen_3_text'),
                  style: kHeader1,
                ),
                SizedBox(
                  height: 6.0,
                ),
                _buildLotteryFieldSelection(),
                SizedBox(
                  height: 20.0,
                ),
                _buildGenerateButton()
              ],
            ),
          ),
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
              style: kSmallBoldText,
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
            )
          ],
        );
      }).toList(),
    );
  }

  Widget _buildLotteryNumberSlider(BuildContext context) {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);
    // setting listen to false explicitly results in no rebuild of the Widget,
    // which is not really necessary
    generationData = generationDataProvider.getGenerationData();
    int minGenNum = generationData.selectedSystem.minGeneratedNumbers;
    int maxGenNum = generationData.selectedSystem.maxGeneratedNumbers;

    return Column(
      children: <Widget>[
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
          label: '${_numCnt.toInt()}',
          inactiveColor: kColorSix.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget _buildLotteryFieldSelection() {
    final generationDataProvider = Provider.of<GenerationDataProvider>(context);
    generationData = generationDataProvider.getGenerationData();

    return Center(
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 8.0,
        children: supportedLotteryFields.map((field) {
          return Column(
            children: <Widget>[
              Text(
                field.numberIdentifier.toString(),
                style: kSmallBoldText,
              ),
              Radio(
                value: field,
                groupValue: _lotField,
                onChanged: (value) {
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
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, GenResultScreen.id);
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppTextUtils.getUIText(context, 'start_screen_btn_generate'),
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
