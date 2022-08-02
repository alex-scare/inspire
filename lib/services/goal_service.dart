import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:inspire/models/goal.dart';

class GoalService extends ChangeNotifier {
  static const String _boxName = "goal-box-3";

  List<Goal> _goals = [];
  Map<dynamic, Goal> _goalsMap = {};

  void initService() async {
    var box = await Hive.openBox<Goal>(_boxName);

    _syncChanges(box);
  }

  void _syncChanges(Box<Goal> box) {
    _goals = box.values.toList();
    _goalsMap = box.toMap();
    notifyListeners();
  }

  Goal? getGoal(dynamic key) {
    return _goalsMap[key];
  }

  void addGoal(Goal goal) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.put(goal.id, goal);

    _syncChanges(box);
  }

  void deleteGoal(dynamic key) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.delete(key);

    _syncChanges(box);
  }

  void editGoal(dynamic key, Goal goal) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.put(key, goal);

    _syncChanges(box);
  }

  void pinGoal(dynamic key) async {
    var changingGoal = _goalsMap[key];
    if (changingGoal == null) return;

    changingGoal.isPinned = !changingGoal.isPinned;
    editGoal(key, changingGoal);
  }

  int get goalCount {
    return _goals.length;
  }

  List<Goal> get goals {
    return _goals;
  }

  List<Goal> get sortedGoals {
    _goals.sort((a, b) => b.isPinned ? 1 : -1);
    return _goals;
  }
}
