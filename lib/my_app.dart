import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/navigation/app_router.dart';
import 'package:profile/ui/theme/app_theme.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    var goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rakshith\'s Profile',
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      routerConfig: goRouter,
    );
  }
}

//       theme: ThemeData(
//         primaryColorDark: Colors.black38,
//         brightness: Brightness.light,
//         scaffoldBackgroundColor: Colors.white70,
//         // backgroundColor: Colors.white70
//       ),
