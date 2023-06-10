import 'package:flutter/material.dart';

class addPostPage extends StatefulWidget {
  const addPostPage({super.key});

  @override
  State<addPostPage> createState() => _addPostPageState();
}

class _addPostPageState extends State<addPostPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Berita"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Column(
            children: [
              TextFormField(), //139:54
            ],
          ),
        ),
      ),
    );
  }
}
