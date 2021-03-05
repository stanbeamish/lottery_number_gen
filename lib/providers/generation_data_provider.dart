import 'package:flutter/cupertino.dart';
import 'package:lotterynumbergen/models/lottery_field.dart';
import 'package:lotterynumbergen/models/lottery_number.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';

class GenerationDataProvider extends ChangeNotifier {
  GenerationData _generationData;

  GenerationDataProvider(
    this._generationData,
  );

  getGenerationData() => _generationData;

  setGenerationData(GenerationData generationData) async {
    _generationData = generationData;
    notifyListeners();
  }
}

class GenerationData {
  LotteryNumber? selectedLotteryNumber;
  LotteryField? selectedLotteryField;
  LotterySystem? selectedSystem;

  GenerationData({
    this.selectedLotteryNumber,
    this.selectedLotteryField,
    this.selectedSystem,
  });


}
