//TODO Complete the implementation of this class

import 'package:flutter/material.dart';
import 'package:exercise4/models/note.dart';
import 'main_viewmodel.dart';
import '../view.dart';

/// `MainFloat` is show the Floating Action Button (i.e, the Add or the + button)
///
class MainFloat extends StatelessWidget {
  const MainFloat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View<MainViewmodel>(
      shouldRebuild: false,
      builder: (_, vm, __) {
        print('Build MainFloat + button');

        return FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {
              Note newNote = Note(title: 'Untitled Note', content: 'Content');
              vm.addNote(newNote);
            });
      },
    );
  }
}
