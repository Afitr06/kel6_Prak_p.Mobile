import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rest_api/controllers/post_controllers.dart';
import 'package:rest_api/models/comment.dart' as c;
import 'package:rest_api/models/post.dart';
import 'package:rest_api/utils/endpoint.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});
  final Post post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final PostController postController = PostController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Post"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.post.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.width,
                child: Text(
                  widget.post.body,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                "Komentar",
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                child: FutureBuilder<List<c.comments>>(
                  future: postController.fetchComments(widget.post.Id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        List<c.comments> comment = snapshot.data!;
                        return ListView.separated(
                          //125:53 (Ilyasa)
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(comment[index].name),
                                subtitle: Text(comment[index].body),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.0005,
                            );
                          },
                          itemCount: comment.length,
                        );
                      } else {
                        return const Text(
                          "Belum ada yang berkomentar",
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SizedBox(
                            width: size.width * 0.2,
                            height: size.width * 0.2,
                            child: const CircularProgressIndicator(),
                          ));
                    } else {
                      return Text("err");
                    }
                  },
                ),
              ),
              SizedBox(
                width: size.width,
                child: Text(
                  widget.post.body,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
