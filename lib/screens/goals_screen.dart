import 'package:flutter/material.dart';
import 'package:inspire/modals/goal_edit.dart';
import 'package:inspire/services/goal_service.dart';
import 'package:inspire/widgets/app_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    final goalService = Provider.of<GoalService>(context);

    goalService.initGoals();

    return Scaffold(
        appBar: CustomAppBar(
          title: 'Your goals',
          trailing: GestureDetector(
            child: Icon(Icons.add,
                color: Theme.of(context).colorScheme.onBackground),
            onTap: () {
              showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) => const GoalEditModal());
            },
          ),
        ),
        body: ListView.builder(
          itemCount: goalService.goalCount * 2,
          itemBuilder: ((context, index) {
            if (index.isOdd) return const Divider(thickness: 1.0);

            int itemIndex = index ~/ 2;
            final current = goalService.getGoal(itemIndex);

            return ListTile(
              title: Text(current.title),
              leading: Icon(
                IconData(current.iconHash, fontFamily: 'MaterialIcons'),
                color: Theme.of(context).primaryColor,
              ),
            );
          }),
        ));
  }
}
