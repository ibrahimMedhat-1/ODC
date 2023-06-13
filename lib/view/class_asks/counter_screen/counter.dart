import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            Text(
              '$counter',
            ),
            IconButton(
              icon: Icon(
                Icons.remove,
              ),
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
