import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/account/view/account_page.dart';

TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();

class NoteWritePage extends StatefulWidget {
  const NoteWritePage({super.key});

  static Route<NoteWritePage> route() {
    return MaterialPageRoute(
      builder: (context) => const NoteWritePage(),
    );
  }

  @override
  State<NoteWritePage> createState() => _NoteWritePageState();
}

class _NoteWritePageState extends State<NoteWritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: ColoredBox(
              color: Colors.transparent,
              child: Icon(Icons.check),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              AccountPage.route(),
            ),
            child: ColoredBox(
              color: Colors.transparent,
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
          const SizedBox(width: 20),
        ],
        centerTitle: true,
        title: new Text(
          "FastNote",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(hintText: 'Title'),
                controller: title,
              ),
            ),
            Expanded(
                child: Container(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Content'),
                controller: content,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
