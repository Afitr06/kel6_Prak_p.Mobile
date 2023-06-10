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
<<<<<<< HEAD
              TextFormField(), //139:54
=======
              TextFormField(),//139:54 (Deni)
>>>>>>> 71d8ad83b98a391c71b65ba2564159f664201c31
            ],
          ),
        ),
      ),
    );
  }
}
