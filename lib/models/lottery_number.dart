enum SupportedNumbers { five, six, seven, eight, nine, ten }

class LotteryNumber {
  final int? numberIdentifier;
  final SupportedNumbers? name;

  const LotteryNumber({this.name, this.numberIdentifier});
}

const supportedLotteryNumbers = [
  LotteryNumber(name: SupportedNumbers.five, numberIdentifier: 5),
  LotteryNumber(name: SupportedNumbers.six, numberIdentifier: 6),
  LotteryNumber(name: SupportedNumbers.seven, numberIdentifier: 7),
  LotteryNumber(name: SupportedNumbers.eight, numberIdentifier: 8),
  LotteryNumber(name: SupportedNumbers.nine, numberIdentifier: 9),
  LotteryNumber(name: SupportedNumbers.ten, numberIdentifier: 10),
];