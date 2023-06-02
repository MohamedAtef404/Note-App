import '../helper/logic.dart';

class Remove {
  final Logic _logic = Logic();
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();
  
  void deleteNote({required int index}) {
    _listOfNotes.removeAt(index);
    
    _logic.addToPrefs(_listOfNotes);
  }
}