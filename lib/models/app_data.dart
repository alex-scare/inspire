import 'package:inspire/models/day.dart';
import 'package:inspire/models/goal.dart';

class AppData {
  AppData({
    required this.days,
    required this.goals,
  });

  late List<Goal> goals;
  late List<Day> days;
}
