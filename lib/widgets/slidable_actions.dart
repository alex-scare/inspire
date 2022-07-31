import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActions extends StatelessWidget {
  const SlidableActions({
    Key? key,
    required this.child,
    this.delete,
    this.edit,
    this.pin,
    this.extentRatio = 0.5,
  }) : super(key: key);

  final Widget child;
  final Function? delete;
  final Function? edit;
  final Function? pin;
  final double extentRatio;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: edit != null
          ? ActionPane(
              motion: const ScrollMotion(),
              extentRatio: extentRatio,
              children: [
                if (edit != null)
                  SlidableAction(
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onTertiaryContainer,
                    icon: Icons.edit,
                    label: 'Edit',
                    onPressed: (context) => edit!(),
                  )
              ],
            )
          : null,
      endActionPane: pin != null || delete != null
          ? ActionPane(
              motion: const ScrollMotion(),
              extentRatio: extentRatio,
              children: [
                if (delete != null)
                  SlidableAction(
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onTertiaryContainer,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context) => delete!(),
                  ),
                if (pin != null)
                  SlidableAction(
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onTertiaryContainer,
                    icon: Icons.pin,
                    label: 'Pin',
                    onPressed: (context) => pin!(),
                  )
              ],
            )
          : null,
      child: child,
    );
  }
}
