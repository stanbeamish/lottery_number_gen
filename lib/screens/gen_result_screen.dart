import 'package:flutter/material.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:provider/provider.dart';

class GenResultScreen extends StatelessWidget {
  static String id = 'genresultscreen';

  @override
  Widget build(BuildContext context) {
    return Consumer<GenerationDataProvider>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Result'),
          ),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(model.getGenerationData().selectedNumbersCount.toString()),
                Text(model.getGenerationData().selectedFieldCount.toString()),
                Text(model.getGenerationData().selectedSystem.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
