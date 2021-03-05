enum SupportedSystems { euroJackpot, sixOf49 } // euroMillions etc. to follow

class LotterySystem {
  final SupportedSystems systemIdentifier;
  final String name;
  final int maxNumber;
  final int minGeneratedNumbers;
  final int maxGeneratedNumbers;

  const LotterySystem({
    required this.name,
    required this.systemIdentifier,
    required this.maxNumber,
    required this.minGeneratedNumbers,
    required this.maxGeneratedNumbers,
  });
}

const supportedLotterySystems = [
  LotterySystem(
      name: 'EuroJackpot',
      maxNumber: 50,
      systemIdentifier: SupportedSystems.euroJackpot,
      minGeneratedNumbers: 5,
      maxGeneratedNumbers: 10),
  LotterySystem(
      name: '6 aus 49',
      maxNumber: 49,
      systemIdentifier: SupportedSystems.sixOf49,
      minGeneratedNumbers: 6,
      maxGeneratedNumbers: 10),
];
