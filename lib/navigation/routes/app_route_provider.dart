import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/navigation/route_provider.dart';
import 'package:profile/features/app_shell.dart';
import 'package:profile/features/career/career_page.dart';
import 'package:profile/features/contact/contact_page.dart';
import 'package:profile/navigation/routes/app_route_name.dart';
import 'package:profile/features/profile/views/profile_page.dart';

class AppRoutesProvider extends RouteProvider {
  // ignore_for_file: method_code_length_exceeds
  @override
  List<RouteBase> routes() {
    return [
      GoRoute(
        name: AppRouteName.root,
        path: '/',
        redirect: (context, state) {
          // Redirect only if the user is exactly on '/'
          if (state.uri.toString() == '/') {
            return 'me'; // Or any default path you want
          }
          return null; // No redirect for other paths
        },
        routes: [
          ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return AppShell(state: state, child: child);
            },
            routes: [
              GoRoute(
                path: 'me',
                name: AppRouteName.me,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    NoTransitionPage(child: ProfilePage()),
              ),
              GoRoute(
                path: 'career',
                name: AppRouteName.career,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    NoTransitionPage(child: CareerPage()),
              ),
              GoRoute(
                path: 'projects',
                name: AppRouteName.projects,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    NoTransitionPage(child: Center(child: Text('Projects'))),
              ),
              GoRoute(
                path: 'education',
                name: AppRouteName.education,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    NoTransitionPage(child: Center(child: Text('Education'))),
              ),
              GoRoute(
                path: 'contact',
                name: AppRouteName.contact,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    NoTransitionPage(child: ContactPage()),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
