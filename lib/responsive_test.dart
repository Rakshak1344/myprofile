import 'package:flutter/material.dart';
import 'package:profile/arch/view/widgets/responsive_stateful_widget.dart';

class MyResponsivePage extends ResponsiveStatefulWidget {
  const MyResponsivePage({super.key});

  @override
  ResponsiveState<MyResponsivePage> createState() => _MyResponsivePageState();
}

class _MyResponsivePageState extends ResponsiveState<MyResponsivePage> {
  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile View")),
      body: const Center(child: Text("This is Mobile UI")),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tablet View")),
      body: const Center(child: Text("This is Tablet UI")),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Desktop View")),
      body: const Center(child: Text("This is Desktop UI")),
    );
  }
}
