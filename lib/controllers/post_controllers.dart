import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:rest_api/models/comment.dart';
import 'package:rest_api/models/post.dart';
import 'package:rest_api/service/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
            jsonData.length,
            (index) => Post.fromMap(
                  jsonData[index],
                ));
      } else {
        throw Exception();
      }
    });
  }

  Future<List<comment>> fetchComments(int id) async {
    return await PostService().fetchComment(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => comment.fromMap(jsonData[index]),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> delete(int id) async {
    return await PostService().delete(id).then((res) {
      inspect(res);
      var jsonBody = jsonDecode(res.body);
      inspect(jsonBody);
      if (res.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    });
  }
}
