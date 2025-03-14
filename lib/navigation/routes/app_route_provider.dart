import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/arch/navigation/route_provider.dart';
import 'package:profile/features/education/education_page.dart';
import 'package:profile/features/app_shell.dart';
import 'package:profile/features/career/career_page.dart';
import 'package:profile/features/contact/contact_page.dart';
import 'package:profile/features/projects/views/project_page.dart';
import 'package:profile/features/projects/views/projects_page.dart';
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
          return null;
        
          // Redirect only if the user is exactly on '/'
          // if (state.matchedLocation == '/') {
          //   return 'me'; // Or any default path you want
          // }
          // return 'me'; // No redirect for other paths
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
                    const NoTransitionPage(child: ProfilePage()),
              ),
              GoRoute(
                path: 'career',
                name: AppRouteName.career,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: CareerPage()),
              ),
              GoRoute(
                path: 'projects',
                name: AppRouteName.projects,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: ProjectsPage()),
                routes: [
                  GoRoute(
                    path: ':slug',
                    name: AppRouteName.projectDetails,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final String slug =
                          state.pathParameters['slug'] ?? 'Unknown';
                      return NoTransitionPage(child: ProjectPage(slug: slug));
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'education',
                name: AppRouteName.education,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: EducationPage()),
              ),
              GoRoute(
                path: 'contact',
                name: AppRouteName.contact,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    const NoTransitionPage(child: ContactPage()),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
