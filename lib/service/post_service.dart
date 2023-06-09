import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/post.dart';
import 'package:rest_api/utils/endpoint.dart';
import 'package:rest_api/utils/request_helper.dart';

class PostService {
  Future<http.Response> fetch() async {
    String endpoint = Endpoint.post;
    Uri url = Uri.parse(endpoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> fetchComment(int id) async {
    String endpoint = "${Endpoint.post}/$id/comments";
    Uri url = Uri.parse(endpoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> Create(Post post) async {
    String endpoint = Endpoint.post;
    Uri url = Uri.parse(endpoint);
    var jsonBody = post.toMap();

    return await http.post(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> put(Post post) async {
    String endpoint = "${Endpoint.post}/${post.Id}";
    Uri url = Uri.parse(endpoint);
    var jsonBody = post.toMap();

    return await http.put(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> patch({
    required int id,
    String? title,
    String? body,
  }) async {
    String endpoint = "${Endpoint.post}/$id";
    Uri url = Uri.parse(endpoint);

    Map<String, dynamic> jsonBody = {};
    if (title != null) {
      jsonBody["title"] = title;
    }

    if (body != null) {
      jsonBody["body"] = body;
    }

    return await http.patch(
      url,
      body: jsonEncode(jsonBody),
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> delete(int id) async {
    String endpoint = "${Endpoint.post}/$id";
    Uri url = Uri.parse(endpoint);

    return await http.delete(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}
