import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  bool df = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
      ),
      body: Container(
        child: Column(
          children: [
            FloatingActionButton(
                onPressed: () {
                  if (df) {
                    // l.add('dart');
                  } else {
                    // l.add('flutter');
                  }
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
