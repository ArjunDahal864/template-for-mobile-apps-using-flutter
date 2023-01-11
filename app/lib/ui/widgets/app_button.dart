import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  const AppButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: kADborderRadiusCircular,
          color: theme.primaryColor,
        ),
        child: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            color: kColtextColor,
          ),
        ),
      ),
    );
  }
}
