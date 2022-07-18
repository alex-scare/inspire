import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/goal.dart';
import 'package:inspire/widgets/cupertino_text_input.dart';
import 'package:inspire/widgets/icon_list_input.dart';

class GoalEditModal extends StatefulWidget {
  const GoalEditModal({Key? key}) : super(key: key);

  @override
  State<GoalEditModal> createState() => _GoalEditModalState();
}

class _GoalEditModalState extends State<GoalEditModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          brightness: Theme.of(context).brightness,
          middle: Text('Create your goal',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground)),
        ),
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Form(
                  child: Column(
                children: [
                  CupertinoFormSection.insetGrouped(
                      backgroundColor: Colors.transparent,
                      margin: const EdgeInsets.all(0),
                      children: const [
                        CupertinoTextInput(
                            label: 'Title',
                            autofocus: true,
                            placeholder: 'Name your goal',
                            value: ''),
                      ]),
                  IconListInput(
                    value: 0xe0b2,
                    options: List.from(iconHashCode.values),
                  ),
                ],
              ))),
        ));
  }
}
