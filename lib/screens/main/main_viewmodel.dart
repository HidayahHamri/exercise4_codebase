// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of the viewmodel for the main screen

import '../viewmodel.dart';

import 'package:exercise4/app/service_locator.dart';
import 'package:exercise4/models/note.dart';
import 'package:exercise4/services/note/note_service.dart';

/// `MainViewmodel` the class for the viewmodel of the main screen.
/// Things that you will implement in this class:
///
///  - Declare all related attributes mainly the states
///  - Method method to handle fetching notes from the data service.
///  - Method to handle adding a new note.
///  - Method to handle deleting a note.
///  - Method to handle updating a note.

class MainViewmodel extends Viewmodel {
  final _service = locator<NoteService>();
  List<Note> _list;

  Note getNote(int index) => _list == null ? null : _list[index];
  int get noteCount => _list == null ? 0 : _list.length;
  int _editIndex;
  int get editIndex => _editIndex;
  set editIndex(value) => _editIndex = value;

  @override
  init() => update(() async {
        _list = await _service.fetchNotes();
        super.init();
      });

  void changeNote(int index) => update(() async {
        editIndex = index;
      });

  void deleteNote(dynamic id) => update(() async {
        editIndex;
        await _service.removeNote(id);
        _list.removeAt(id);
      });

  void addNote(Note note) => update(() async {
        editIndex;
        final detail = await _service.addNote(note);
        _list.add(detail);
      });

  void updateNote({dynamic id, Note data}) => update(() async {
        final detail = await _service.updateNote(id: id, data: data);
        final index = _list.indexWhere((note) => note.id == id);
        if (index == 0) return;
        _list[index] = detail;
      });
}
