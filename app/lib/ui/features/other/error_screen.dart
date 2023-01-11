import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/generated/l10n.dart';

class ErrorScreen extends StatelessWidget {
  final GoRouterState state;
  const ErrorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l1on = S.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          l1on.pageNotFound,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
