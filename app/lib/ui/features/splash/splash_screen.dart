import 'package:animations/animations.dart';
import 'package:app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/splash_cubit.dart';

/// App Dependencies

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<SplashCubit>(),
        child: const _SpalshView(),
      );
}

class _SpalshView extends StatelessWidget {
  const _SpalshView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => context.read<SplashCubit>().load(),
          );
        },
        builder: (context, state) {
          state.whenOrNull(
            initial: () => context.read<SplashCubit>().load(),
          );

          return const _SplashWidget();
        },
      ),
    );
  }
}

class _SplashWidget extends StatefulWidget {
  const _SplashWidget();

  @override
  State<_SplashWidget> createState() => __SplashWidgetState();
}

class __SplashWidgetState extends State<_SplashWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animatiion = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeScaleTransition(
            animation: _animatiion,
            child: Image.asset(
              height: 250,
              width: 250,
              scale: 1,
              "assets/png/logo.png",
            ),
          ),
        ],
      ),
    );
  }
}
