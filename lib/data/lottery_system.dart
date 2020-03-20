enum SupportedSystems { euroJackpot, sixOf49, sixOf45, euroMillions }

class LotterySystem {
  final SupportedSystems systemIdentifier;
  final String name;

  const LotterySystem({this.name, this.systemIdentifier});
}

const supportedLotterySystems = [
  LotterySystem(
    name: 'Euro Jackpot',
    systemIdentifier: SupportedSystems.euroJackpot,
  ),
  LotterySystem(
    name: '6 aus 49',
    systemIdentifier: SupportedSystems.sixOf49,
  ),
];