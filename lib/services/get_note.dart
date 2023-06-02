import '../helper/logic.dart';
import '../models/note_model.dart';

class GetNotes {
  List<dynamic> getNotes() {
      List<dynamic> data = Logic().getFromPrefs();
      List<NoteModel> notes = [];
      for (int i = 0; i < data.length; i++) {
        notes.add(NoteModel.fromJson(data[i]));
      }
      return notes;
  }
}