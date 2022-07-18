import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Form(
              child: Column(
            children: [
              CupertinoFormSection.insetGrouped(children: [
                CupertinoFormRow(
                    prefix: const Text(
                      'Title',
                    ),
                    child: CupertinoTextFormFieldRow(
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      placeholder: 'Name your goal',
                    )),
              ])
            ],
          )),
        ));
  }
}
