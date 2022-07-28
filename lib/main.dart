import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inspire/models/global_state.dart';
import 'package:inspire/models/goal.dart';
import 'package:inspire/screens/app_screen.dart';
import 'package:inspire/services/goal_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoalAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalStateModel()),
        ChangeNotifierProvider(create: (context) => GoalService()),
      ],
      child: const AppScreen(),
    );
  }
}
