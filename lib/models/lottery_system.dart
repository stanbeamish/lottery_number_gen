import 'package:flutter/material.dart';

enum SupportedSystems { euroJackpot, sixOf49, sixOf45, euroMillions }

class LotterySystem {
  final SupportedSystems systemIdentifier;
  final String name;
  final int maxNumber;

  const LotterySystem({@required this.name, @required this.systemIdentifier, @required this.maxNumber});
}

const supportedLotterySystems = [
  LotterySystem(
    name: 'Euro Jackpot',
    maxNumber: 50,
    systemIdentifier: SupportedSystems.euroJackpot,
  ),
  LotterySystem(
    name: '6 aus 49',
    maxNumber: 49,
    systemIdentifier: SupportedSystems.sixOf49,
  ),
];



    
