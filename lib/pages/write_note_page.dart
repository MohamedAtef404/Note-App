import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key, this.title, this.content, this.index});

  final String? title, content;
  final int? index;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  File? image;
  final imagePicker = ImagePicker();
  uploadImage() async {
    var PickedIamge = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = File(PickedIamge!.path);
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.title ?? '';
    contentController.text = widget.content ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (contentController.text.isNotEmpty) {
                if (widget.title != null && widget.content != null) {
                  Provider.of<ServicesProvider>(context, listen: false)
                      .updateNote(
                          title: titleController.text,
                          content: contentController.text,
                          index: widget.index!);
                } else {
                  Provider.of<ServicesProvider>(context, listen: false).addNote(
                      title: titleController.text,
                      content: contentController.text);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('please type in content'),
                  ),
                );
              }
            },
            icon: Icon(
              size: 30,
              Icons.save_as_sharp,
              color: Colors.yellow,
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            size: 30,
            Icons.arrow_back,
          ),
          color: Colors.yellow,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Note', style: TextStyle(color: Colors.black)),
      ),

      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'june 26,2023 15:15 PM',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: titleController,
                  style: TextStyle(fontSize: 50),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 50),

                
                TextFormField(
                  controller: contentController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note Something Down',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                //image != null
                   // ?
                    //  SizedBox(
                    //     child: Image.file(image!),
                    //     height: 200,
                    //   )
                    // : SizedBox()
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            //  height: 75,
            color: Colors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {} // uploadImage
                        ,
                        icon: Icon(
                          Icons.camera_enhance,
                          size: 30,
                        ),
                      ),
                      Text('camera')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: uploadImage,
                        icon: Icon(
                          Icons.photo,
                          size: 30,
                        ),
                      ),
                      Text('gallery')
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
