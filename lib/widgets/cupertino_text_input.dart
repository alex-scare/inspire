import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextInput extends StatelessWidget {
  const CupertinoTextInput({
    Key? key,
    required this.value,
    required this.label,
    required this.autofocus,
    this.placeholder,
  }) : super(key: key);

  final String value;
  final String label;
  final bool autofocus;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
        prefix: Text(label,
            style: TextStyle(color: Theme.of(context).primaryColor)),
        child: CupertinoTextFormFieldRow(
          textCapitalization: TextCapitalization.sentences,
          autofocus: autofocus,
          placeholderStyle: TextStyle(color: Theme.of(context).focusColor),
          placeholder: placeholder,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ));
  }
}
