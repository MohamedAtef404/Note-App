import 'dart:convert';

import 'package:note_app/main.dart';
import 'package:note_app/models/note_model.dart';

List notes = getNote();

 List getNote() {
    if (prefs != null && prefs!.getString('notess') != null) {
      String? jsondecode = prefs!.getString('notess');
      return jsonDecode(jsondecode!);
    }
    return [];
  } 