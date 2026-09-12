import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_motion.dart';
import '../common/brand_tokens.dart';
import '../main_shell/main_shell_view.dart';

/// Cream canvas with shell visible underneath; splash crossfades out.
class SplashGate extends StatefulWidget {
  const SplashGate({super.key});

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> {
  bool _done = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _done = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.bg,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const MainShellView(),
          AnimatedOpacity(
            opacity: _done ? 0 : 1,
            duration: AppMotion.page,
            child: IgnorePointer(ignoring: _done, child: const _SplashOverlay()),
          ),
        ],
      ),
    );
  }
}

class _SplashOverlay extends StatefulWidget {
  const _SplashOverlay();

  @override
  State<_SplashOverlay> createState() => _SplashOverlayState();
}

class _SplashOverlayState extends State<_SplashOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  late final Animation<double> _mark = CurvedAnimation(
    parent: _c,
    curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
  );
  late final Animation<double> _tag = CurvedAnimation(
    parent: _c,
    curve: const Interval(0.35, 0.8, curve: Curves.easeOutCubic),
  );

  @override
  void initState() {
    super.initState();
    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const hero = BrandTokens.splashHero;
    return ColoredBox(
      color: AppColors.bg.withOpacity(0.72),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            hero,
            fit: BoxFit.cover,
            alignment: const Alignment(0.1, -0.2),
            errorBuilder: (context, error, stack) => const ColoredBox(color: AppColors.bg),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.45, 0.75, 1.0],
                colors: [
                  Color(0x33FFFCF7),
                  Color(0x00FFFCF7),
                  Color(0xB3FFFCF7),
                  Color(0xF2FFFCF7),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 120),
                child: AnimatedBuilder(
                  animation: _c,
                  builder: (context, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: _mark.value,
                          child: Transform.scale(
                            scale: 0.94 + 0.06 * _mark.value,
                            child: const BrandMark(height: 44),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Opacity(
                          opacity: _tag.value,
                          child: Text(
                            BrandTokens.tagline,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.height = 24});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      BrandTokens.logoAsset,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stack) => Text(
        BrandTokens.name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: height * 0.8,
              color: AppColors.ink,
            ),
      ),
    );
  }
}
