import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/goal.dart';
import 'package:inspire/services/goal_service.dart';
import 'package:inspire/widgets/cupertino_text_input.dart';
import 'package:inspire/widgets/icon_list_input.dart';
import 'package:inspire/extensions/theme.dart';
import 'package:provider/provider.dart';

class FormData {
  String title = '';
  int iconHash = 0xf04be;
}

class GoalEditModal extends StatefulWidget {
  const GoalEditModal({Key? key, this.mode = 'create', this.goal})
      : super(key: key);

  final String mode;
  final Goal? goal;

  @override
  State<GoalEditModal> createState() => _GoalEditModalState();
}

class _GoalEditModalState extends State<GoalEditModal> {
  final _formKey = GlobalKey<FormState>();
  String modalTitle = 'Create new goal';
  var data = FormData();

  @override
  void initState() {
    if (widget.goal != null) {
      data.iconHash = widget.goal?.iconHash ?? data.iconHash;
      data.title = widget.goal?.title ?? data.title;
    }
    if (widget.mode == 'edit') modalTitle = 'Edit your goal';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goalService = Provider.of<GoalService>(context);

    void submitForm() {
      if (widget.goal != null) {
        var goal = widget.goal;
        goal?.iconHash = data.iconHash;
        goal?.title = data.title;
      } else {
        goalService.addGoal(Goal(title: data.title, iconHash: data.iconHash));
      }
    }

    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: context.theme.backgroundColor,
          brightness: context.theme.brightness,
          trailing: GestureDetector(
            onTap: () {
              submitForm();
              Navigator.of(context).pop();
            },
            child: Icon(Icons.done, color: context.theme.primaryColor),
          ),
          middle: Text(modalTitle,
              style: TextStyle(color: context.colors.onBackground)),
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
                        initialValue: data.iconHash,
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
