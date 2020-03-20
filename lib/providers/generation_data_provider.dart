import 'package:flutter/cupertino.dart';
import 'package:lotterynumbergen/data/lottery_field.dart';
import 'package:lotterynumbergen/data/lottery_system.dart';

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
  int selectedNumbersCount;
  SupportedFields selectedFieldCount;
  SupportedSystems selectedSystem;

  GenerationData({
    this.selectedNumbersCount,
    this.selectedFieldCount,
    this.selectedSystem,
  });


}
