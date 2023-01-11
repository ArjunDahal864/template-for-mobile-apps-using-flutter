import 'package:flutter/material.dart';

class CustomScrollBehaviour extends ScrollBehavior {
  const CustomScrollBehaviour();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      );
}
