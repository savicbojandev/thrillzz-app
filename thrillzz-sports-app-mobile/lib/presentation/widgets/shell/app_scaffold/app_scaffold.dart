import 'package:flutter/material.dart';
import 'package:thrillzz_sports_app/presentation/widgets/shell/app_scaffold/app_scaffold_styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    required this.title,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Padding(
          padding: AppScaffoldStyles.pagePadding,
          child: body,
        ),
      ),
    );
  }
}
