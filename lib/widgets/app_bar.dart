import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/extensions.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      transitionBetweenRoutes: false,
      backgroundColor: context.theme.backgroundColor,
      trailing: trailing,
      middle: Text(title, style: TextStyle(color: context.colors.onBackground)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
