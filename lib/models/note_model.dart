import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String content;


  NoteModel({required this.title, required this.content});

  factory NoteModel.fromJson(Map<String, dynamic> data) {
    return NoteModel(
      title: data['title'],
      content: data['content'],
    );
  }
}