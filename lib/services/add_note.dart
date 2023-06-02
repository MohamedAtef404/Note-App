// 
import '../helper/logic.dart';

class AddNote {
  final Logic _logic = Logic();
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();
  
  void addNote({required String title, required String content}) {
    _listOfNotes.add({
      'title': (title.isNotEmpty) ? title : 'Title',
      'content': content,
    });
    _logic.addToPrefs(_listOfNotes);
  }
}