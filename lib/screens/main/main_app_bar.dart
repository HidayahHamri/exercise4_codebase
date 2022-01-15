//TODO Complete the implementation of this class

import 'package:flutter/material.dart';
import '../view.dart';
import 'main_viewmodel.dart';

/// MainAppBar is to show the application bar
///
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, int>(
      selector: (_, vm) => vm.noteCount,
      builder: (_, vm, __, ___) {
        print('Build App Bar');
        return AppBar(
          title: Text('My Notes'),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: Text(
                '${vm.noteCount}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
