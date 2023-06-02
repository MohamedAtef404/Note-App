import 'dart:convert';

import '../main.dart';

class Logic {
  List<dynamic> getFromPrefs() {
    //&& prefs!.getString('notes')!.isNotEmpty
    if (prefs!.getString('notes') != null) {
      return jsonDecode(prefs!.getString('notes')!);
    }
    return [];
  }

  void addToPrefs(List<dynamic> listOfNotes) {
    prefs!.setString('notes', jsonEncode(listOfNotes));
  }
}