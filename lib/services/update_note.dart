import '../helper/logic.dart';

class UpdateNote {
  final Logic _logic = Logic();
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();
  void updateNote(
      {required String title,
      required String content,
      required int index}) {
    _listOfNotes.replaceRange(index, index + 1, [
      {
        'title': (title.isNotEmpty) ? title : 'Title',
        'content': content,
      }
    ]);
    _logic.addToPrefs(_listOfNotes);
  }
}