import 'package:hive/hive.dart';

part 'goal.g.dart';

@HiveType(typeId: 0)
class Goal extends HiveObject {
  Goal({
    required this.id,
    required this.title,
    required this.iconHash,
    this.power = 0,
    this.repeatCountToDone = 1,
    this.isArchived = false,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int iconHash;
  @HiveField(3)
  final int power;
  @HiveField(4)
  final int repeatCountToDone;
  @HiveField(5)
  final bool isArchived;
}

Map<String, int> iconHashCode = {
  "account_balance_wallet": 0xe041,
  "airline_seat_individual_suite": 0xe067,
  "apple": 0xf04be,
  "architecture": 0xe090,
  "attach_money": 0xe0b2,
  "cottage": 0xe19b,
  "currency_bitcoin": 0xf06bc,
  "directions_walk": 0xe1e1,
  "laptop": 0xe367,
  "book": 0xe0ef,
  "keyboard": 0xe351,
  "lightbulb": 0xe37b,
  "palette": 0xe46b,
  "headset": 0xe301,
  "newspaper": 0xf0541,
};
