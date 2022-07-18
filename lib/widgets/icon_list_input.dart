import 'package:flutter/material.dart';

class IconListInput extends StatefulWidget {
  const IconListInput(
      {Key? key,
      required this.options,
      required this.initialValue,
      required this.onChanged})
      : super(key: key);

  final int initialValue;
  final List<int> options;
  final void Function(int value) onChanged;

  @override
  State<IconListInput> createState() => _IconListInputState();
}

class _IconListInputState extends State<IconListInput> {
  int value = 0;

  @override
  void initState() {
    value = widget.initialValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        childAspectRatio: 1.0,
      ),
      itemCount: widget.options.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final int option = widget.options[index];
        final bool isSelected = option == value;
        return Container(
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : null,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(15),
            child: GestureDetector(
                child: Icon(
                  IconData(option, fontFamily: 'MaterialIcons'),
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
                onTap: () {
                  widget.onChanged(option);
                  setState(() {
                    value = option;
                  });
                }));
      },
    );
  }
}
