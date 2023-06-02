import 'package:flutter/material.dart';
import '../services/add_note.dart';
import '../services/delete_note.dart';
import '../services/get_note.dart';
import '../services/update_note.dart';

class ServicesProvider extends ChangeNotifier {
  List<dynamic>? getNotes() {
    return GetNotes().getNotes();
  }

  void addNote({required String title, required String content}) {
    AddNote().addNote(title: title, content: content);
    notifyListeners();
  }

  void updateNote({
    required String title,
    required String content,
    required int index,
  }) {
    UpdateNote().updateNote(title: title, content: content, index: index);
    notifyListeners();
  }

  void delete({required int index}) {
    Remove().deleteNote(index: index);
    notifyListeners();
  }
}
