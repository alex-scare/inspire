import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/goal.dart';
import 'package:inspire/widgets/cupertino_text_input.dart';
import 'package:inspire/widgets/icon_list_input.dart';

class FormData {
  String title = '';
  int iconHash = 0xf04be;
}

class GoalEditModal extends StatefulWidget {
  const GoalEditModal({Key? key}) : super(key: key);

  @override
  State<GoalEditModal> createState() => _GoalEditModalState();
}

class _GoalEditModalState extends State<GoalEditModal> {
  final _formKey = GlobalKey<FormState>();
  var data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          brightness: Theme.of(context).brightness,
          trailing: GestureDetector(
            onTap: () {},
            child: Icon(Icons.done, color: Theme.of(context).primaryColor),
          ),
          middle: Text('Create new goal',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground)),
        ),
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CupertinoFormSection.insetGrouped(
                          backgroundColor: Colors.transparent,
                          margin: const EdgeInsets.all(0),
                          children: [
                            CupertinoTextInput(
                                label: 'Title',
                                autofocus: true,
                                placeholder: 'Name your goal',
                                onChanged: (value) {
                                  data.title = value ?? '';
                                },
                                initialValue: data.title),
                          ]),
                      IconListInput(
                        initialValue: 0xe0b2,
                        onChanged: (value) {
                          data.iconHash = value;
                        },
                        options: List.from(iconHashCode.values),
                      ),
                    ],
                  ))),
        ));
  }
}
