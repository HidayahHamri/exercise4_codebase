//TODO Complete the implementation of this class

import 'package:flutter/material.dart';

import 'note_editor_tile.dart';
import 'note_tile.dart';
import '../view.dart';
import 'main_viewmodel.dart';

/// `MainBody` the body of the main screen.
/// It should display the list of notes.
/// If the note is under editing, show the note with `NoteEditor` tile widget.
/// Otherwise, show the note with `NoteTile` widget
///
class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<MainViewmodel, int>(
        selector: (_, vm) => vm.noteCount,
        builder: (_, vm, __, ___) {
          print('Build ListView');
          return ListView.separated(
            itemCount: vm.noteCount,
            separatorBuilder: (____, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (___, index) => (vm.editIndex == index)
                ? NoteEditorTile(index)
                : NoteTile(index),
          );
        },
      ),
    );
  }
}
