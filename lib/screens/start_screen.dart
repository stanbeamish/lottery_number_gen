import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lotterynumbergen/screens/settings_screen.dart';
import 'package:lotterynumbergen/utils/app_text_utils.dart';

class StartScreen extends StatefulWidget {
  static String id = 'startscreen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
      body: Container(
        child: Text('Container'),
      ),
    );
  }
}
