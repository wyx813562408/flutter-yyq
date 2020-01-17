import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('书架'),
    );
  }
}



