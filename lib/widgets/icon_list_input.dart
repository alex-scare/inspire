import 'package:flutter/material.dart';

class IconListInput extends StatelessWidget {
  const IconListInput({Key? key, required this.options, required this.value})
      : super(key: key);

  final int value;
  final List<int> options;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        childAspectRatio: 1.0,
      ),
      itemCount: options.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final int option = options[index];
        final bool isSelected = option == value;
        return Container(
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : null,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(15),
            child: IconButton(
                icon: Icon(
                  IconData(option, fontFamily: 'MaterialIcons'),
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
                onPressed: () {}));
      },
    );
  }
}
