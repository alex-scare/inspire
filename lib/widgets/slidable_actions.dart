import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspire/extensions/theme.dart';

class SlidableActions extends StatelessWidget {
  const SlidableActions({
    Key? key,
    required this.child,
    this.delete,
    this.edit,
    this.pin,
    this.unpin,
    this.extentRatioLeft = 0.4,
    this.extentRatioRight = 0.4,
  }) : super(key: key);

  final Widget child;
  final Function? delete;
  final Function? edit;
  final Function? pin;
  final Function? unpin;
  final double extentRatioLeft;
  final double extentRatioRight;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      startActionPane: edit != null
          ? ActionPane(
              motion: const ScrollMotion(),
              extentRatio: extentRatioLeft,
              children: [
                if (edit != null)
                  SlidableAction(
                    backgroundColor: context.colors.secondaryContainer,
                    foregroundColor: context.colors.onSecondaryContainer,
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
              extentRatio: extentRatioRight,
              children: [
                if (delete != null)
                  SlidableAction(
                    backgroundColor: context.colors.errorContainer,
                    foregroundColor: context.colors.onErrorContainer,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: (context) => delete!(),
                  ),
                if (pin != null)
                  SlidableAction(
                    backgroundColor: context.colors.tertiaryContainer,
                    foregroundColor: context.colors.onTertiaryContainer,
                    icon: Icons.push_pin,
                    label: 'Pin',
                    onPressed: (context) => pin!(),
                  ),
                if (unpin != null)
                  SlidableAction(
                    backgroundColor: context.colors.tertiaryContainer,
                    foregroundColor: context.colors.onTertiaryContainer,
                    icon: Icons.push_pin_outlined,
                    label: 'Unpin',
                    onPressed: (context) => unpin!(),
                  ),
              ],
            )
          : null,
      child: child,
    );
  }
}
