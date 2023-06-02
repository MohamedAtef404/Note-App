import 'package:flutter/material.dart';
import 'package:note_app/pages/write_note_page.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'NotePad',
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Consumer<ServicesProvider>(
          builder: (context, value, child) => Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getNotes()!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return NotePage(
                              index: index,
                              title: value.getNotes()![index].title,
                              content: value.getNotes()![index].content,
                            );
                          },
                        ));
                      },
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text('${value.getNotes()![index].title}'),
                          subtitle: Text('${value.getNotes()![index].content}'),
                          trailing: IconButton(
                              onPressed: () {
                                value.delete(index: index);
                              },
                              icon: Icon(Icons.remove)),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return NotePage();
            },
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
