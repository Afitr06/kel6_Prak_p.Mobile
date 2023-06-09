import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest_api/controllers/post_controllers.dart';
import 'package:rest_api/models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postController.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                inspect(snapshot.data!);
                //Menit ke 48:43
                return Text("ada Data");
              } else {
                return Text("tidak ada Data");
              }
            } else {
              return Text("err");
            }
          },
        ),
      ),
    );
  }
}
