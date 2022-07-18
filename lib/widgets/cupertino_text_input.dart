import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextInput extends StatelessWidget {
  const CupertinoTextInput({
    Key? key,
    required this.label,
    required this.autofocus,
    required this.onChanged,
    this.initialValue = '',
    this.placeholder,
  }) : super(key: key);

  final String? initialValue;
  final String label;
  final bool autofocus;
  final String? placeholder;
  final void Function(String? value) onChanged;

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
          initialValue: initialValue,
          onChanged: onChanged,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ));
  }
}
