
enum SupportedFields { four, five, six, seven, eight, nine, ten, eleven, twelve }

class LotteryField {
  final int numberIdentifier;
  final SupportedFields name;

  const LotteryField({this.name, this.numberIdentifier});
}

const supportedLotteryFields = [
  LotteryField(name: SupportedFields.four, numberIdentifier: 4),
  LotteryField(name: SupportedFields.five, numberIdentifier: 5),
  LotteryField(name: SupportedFields.six, numberIdentifier: 6),
  LotteryField(name: SupportedFields.seven, numberIdentifier: 7),
  LotteryField(name: SupportedFields.eight, numberIdentifier: 8),
  LotteryField(name: SupportedFields.nine, numberIdentifier: 9),
  LotteryField(name: SupportedFields.ten, numberIdentifier: 10),
  LotteryField(name: SupportedFields.twelve, numberIdentifier: 11),
  LotteryField(name: SupportedFields.eleven, numberIdentifier: 12),
];