import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'day.g.dart';

@HiveType(typeId: 1)
class Day {
  Day({required this.dayName, required this.goalId, this.repeatNumber = 0});

  @HiveField(0)
  final String dayName;
  @HiveField(1)
  final int goalId;
  @HiveField(2)
  final int repeatNumber;
}
