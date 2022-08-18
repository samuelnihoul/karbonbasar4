import 'package:flutter/material.dart';

class AppBa extends StatelessWidget implements PreferredSizeWidget {
  const AppBa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      title: Text('Karbon Basar 🏪'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
