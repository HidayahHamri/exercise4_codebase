//TODO Complete the implementation of this class

import 'package:flutter/material.dart';
import 'package:exercise4/models/note.dart';
import 'widgets/custom_text_field.dart';
import 'main_viewmodel.dart';
import '../view.dart';

/// `NoteEditorTile` is a custom ListTile widget that should be
/// shown when a note is under editing.
///
class NoteEditorTile extends StatelessWidget {
  const NoteEditorTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, Note>(
      selector: (_, vm) => vm.getNote(index),
      builder: (_, vm, note, ___) {
        print('Build ListTile $index');

        return ListTile(
          title: CustomTextField(
            initialValue: note.title,
            onChanged: (value) {
              Note newNote = Note(title: value, content: note.content);
              vm.updateNote(id: vm.getNote(index).id, data: newNote);
            },
          ),
          subtitle: CustomTextField(
            maxLines: 3,
            initialValue: note.content,
            onChanged: (value) {
              Note newNote = Note(title: note.title, content: value);
              vm.updateNote(id: vm.getNote(index).id, data: newNote);
            },
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.blue,
              ),
              onPressed: () => vm.deleteNote(vm.getNote(index).id)),
        );
      },
    );
  }
}
