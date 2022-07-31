import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspire/modals/goal_edit.dart';
import 'package:inspire/services/goal_service.dart';
import 'package:inspire/widgets/app_bar.dart';
import 'package:inspire/widgets/slidable_actions.dart';
import 'package:inspire/extensions.dart';
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

    return Scaffold(
        appBar: CustomAppBar(
          title: 'Your goals',
          trailing: GestureDetector(
            child: Icon(Icons.add, color: context.colors.onBackground),
            onTap: () {
              showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) => const GoalEditModal());
            },
          ),
        ),
        body: SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            closeWhenTapped: true,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0.5);
              },
              itemCount: goalService.goalCount,
              itemBuilder: ((context, index) {
                final current = goalService.getGoal(index);

                return SlidableActions(
                  extentRatio: 0.3,
                  edit: () => showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => const GoalEditModal()),
                  child: ListTile(
                    title: Text(current.title),
                    leading: Icon(
                      IconData(current.iconHash, fontFamily: 'MaterialIcons'),
                      color: context.theme.primaryColor,
                    ),
                  ),
                );
              }),
            )));
  }
}
