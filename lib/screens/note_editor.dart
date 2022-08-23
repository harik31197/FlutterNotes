import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesappflutter/styles/app_style.dart';

class NotesEditorScreen extends StatefulWidget {
  const NotesEditorScreen({Key? key}) : super(key: key);

  @override
  State<NotesEditorScreen> createState() => _NotesEditorScreenState();
}

class _NotesEditorScreenState extends State<NotesEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Add new note.",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title",
            ),
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            date,
            style: AppStyle.dateTitle,
          ),
          TextField(
            controller: _contentController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Note",
            ),
            style: AppStyle.mainContent,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "notes_title": _titleController.text,
            "notes_content": _contentController.text,
            "createon_date": date,
            "color_id": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add Note due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
