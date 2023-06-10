import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rest_api/models/post.dart';
import 'package:rest_api/pages/home_page.dart';
import 'package:rest_api/pages/post.page.dart';

class AppRoutes {
  static const home = "home";
  static const post = "post";

  static Page _homePageBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomePage(),
    );
  }

  static Page _postPageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: PostPage(
        post: state.extra as Post,
      ),
    );
  }

  static GoRouter goRouter = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homePageBuilder,
        routes: [
          GoRoute(
            name: post,
            path: "post",
            pageBuilder: _postPageBuilder,
          ),
        ],
      ),
    ],
  );
}
