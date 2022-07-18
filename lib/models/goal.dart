class Goal {
  Goal({
    required this.id,
    required this.title,
    required this.iconHash,
    this.isArchived = false,
  });

  final int id;
  final bool isArchived;
  final String title;
  final int iconHash;
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
