import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:inspire/models/goal.dart';

class GoalService extends ChangeNotifier {
  static const String _boxName = "goal-box";

  List<Goal> _goals = [];

  Goal? _selectedGoal;

  void initService() async {
    var box = await Hive.openBox<Goal>(_boxName);

    _goals = box.values.toList();
    notifyListeners();
  }

  void getGoals() async {
    var box = await Hive.openBox<Goal>(_boxName);

    _goals = box.values.toList();
    notifyListeners();
  }

  Goal getGoal(index) {
    return _goals[index];
  }

  void addGoal(Goal goal) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.add(goal);

    _goals = box.values.toList();
    notifyListeners();
  }

  void deleteGoal(key) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.delete(key);

    _goals = box.values.toList();
    notifyListeners();
  }

  void editGoal({required Goal goal, required int id}) async {
    var box = await Hive.openBox<Goal>(_boxName);

    await box.put(id, goal);

    _goals = box.values.toList();
    setSelectedGoal(id);
    notifyListeners();
  }

  void setSelectedGoal(int id) async {
    var box = await Hive.openBox<Goal>(_boxName);

    _selectedGoal = box.get(id);

    notifyListeners();
  }

  Goal? getSelectedGoal() {
    return _selectedGoal;
  }

  int get goalCount {
    return _goals.length;
  }
}
