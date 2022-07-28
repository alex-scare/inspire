import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inspire/models/app_data.dart';
import 'package:inspire/models/day.dart';
import 'package:inspire/models/goal.dart';

GetIt getIt = GetIt.instance;

enum DatabaseKey { goals, days }

typedef Database = Box<dynamic>;

Future<bool> initHiveDatabase() async {
  await Hive.initFlutter();

  Hive.registerAdapter(DayAdapter());
  Hive.registerAdapter(GoalAdapter());

  var db = await Hive.openBox('app');

  getIt.registerLazySingleton<Database>(() => db);
  return Future.value(true);
}

Future<AppData> restoreAppData() async {
  var db = getIt<Database>();
  var days = db.get(DatabaseKey.days, defaultValue: []).cast<Day>();
  var goals = db.get(DatabaseKey.goals, defaultValue: []).cast<Goal>();
  return AppData(goals: goals, days: days);
}

Future<void> updateAppData(AppData appData) async {
  var db = getIt<Database>();
  db.put(DatabaseKey.days, appData.days);
  db.put(DatabaseKey.goals, appData.goals);
}
