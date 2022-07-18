import 'package:flutter/material.dart';
import 'package:inspire/modals/goal_edit.dart';
import 'package:inspire/models/goal.dart';
import 'package:inspire/widgets/app_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Goal> _items = [
    Goal(id: 123, title: 'Flutter learning', iconHash: 0xe0b2),
    Goal(id: 1234, title: 'Meditation', iconHash: 0xe06c),
    Goal(id: 12345, title: 'Rest in game', iconHash: 0xf562),
  ];

  @override
  Widget build(BuildContext context) {
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
          itemCount: _items.length * 2,
          itemBuilder: ((context, index) {
            if (index.isOdd) return const Divider(thickness: 1.0);

            int itemIndex = index ~/ 2;
            final current = _items[itemIndex];

            return ListTile(
              title: Text(current.title),
              leading:
                  Icon(IconData(current.iconHash, fontFamily: 'MaterialIcons')),
            );
          }),
        ));
  }
}
