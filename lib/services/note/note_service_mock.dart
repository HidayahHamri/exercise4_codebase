// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class
//
import 'note_service.dart';
import '../../models/note.dart';

/// `NoteServiceMock` is a database service for notes that are stored in internal memory.
///
class NoteServiceMock extends NoteService {
  final _mockDb = <Note>[
    Note(
        title: 'What is Flutter?',
        content:
            'Flutter is an open-source UI framework for creating native mobile applications. It allows developers to build mobile applications a single codebase.'),
    Note(
        title: 'Stateful Widgets',
        content:
            'The widgets whose state can be altered once they are built are called stateful Widgets.'),
    Note(
        title: 'Conditional (ternary) operator',
        content:
            'The conditional (ternary) operator in Dart takes three operands: a condition, first expression (if truthy) and second expression (if falsy).'),
  ];

  @override
  Future<List<Note>> fetchNotes() async {
    return [..._mockDb];
  }

  @override
  Future<Note> getNote(id) async {
    final detail = _mockDb.firstWhere((note) => note.id == id, orElse: (null));
    return Note.copy(detail);
  }

  @override
  Future<Note> updateNote({id, Note data}) async {
    final index = _mockDb.indexWhere((note) => note.id == id);
    if (index == 0) {
      return null;
    }
    Note detail = Note(id: id, title: data.title, content: data.content);
    _mockDb[index] = Note.copy(detail);
    return Note.copy(_mockDb[index]);
  }

  @override
  Future<void> removeNote(id) async {
    _mockDb.removeWhere((note) => note.id == id);
  }

  @override
  Future<Note> addNote(Note data) async {
    int id = (_mockDb != null && _mockDb.length > 0) ? _mockDb.last.id + 1 : 1;
    data.id = id;
    Note detail = data;
    _mockDb.add(detail);
    return Note.copy(detail);
  }
}
