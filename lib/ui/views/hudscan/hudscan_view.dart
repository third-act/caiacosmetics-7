import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../common/app_async.dart';
import '../../common/app_colors.dart';
import '../../common/app_haptics.dart';
import '../../common/app_motion.dart';
import '../../common/app_shadows.dart';
import '../../common/app_space.dart';
import '../../kit.dart';

/// Signaturmomentet: ansiktsscan med oval ram. Accent-owned surface på kontrollbandet.
class HudscanView extends StatefulWidget {
  const HudscanView({super.key});

  @override
  State<HudscanView> createState() => _HudscanViewState();
}

class _HudscanViewState extends State<HudscanView>
    with SingleTickerProviderStateMixin {
  bool _scannar = false;
  late final AnimationController _puls = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _puls.dispose();
    super.dispose();
  }

  Future<void> _startScan() async {
    if (_scannar) return;
    AppHaptics.medium();
    setState(() => _scannar = true);
    await Future<void>.delayed(const Duration(milliseconds: 2200));
    if (mounted) setState(() => _scannar = false);
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final pad = tabContentPadding(context);

    return ColoredBox(
      color: AppColors.bg,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/scan-face.jpg',
            fit: BoxFit.cover,
            alignment: const Alignment(0.0, -0.2),
            errorBuilder: (context, error, stack) =>
                const ColoredBox(color: AppColors.plateHigh),
          ),
          AnimatedBuilder(
            animation: _puls,
            builder: (context, _) => CustomPaint(
              size: Size.infinite,
              painter: _FaceFramePainter(puls: _puls.value),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: pad.top + 120,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.bg.withOpacity(0.92),
                    AppColors.bg.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: pad.top),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
                child: Column(
                  children: [
                    Text('Hudscan', style: t.labelSmall),
                    const SizedBox(height: AppSpace.md),
                    Text(
                      'Skanna ansiktet',
                      textAlign: TextAlign.center,
                      style: t.displayMedium,
                    ),
                    const SizedBox(height: AppSpace.sm),
                    Text(
                      'Håll telefonen i ögonhöjd med jämn belysning.',
                      textAlign: TextAlign.center,
                      style: t.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppRadius.card),
                  ),
                  boxShadow: AppShadows.liftShadow,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSpace.screen,
                    AppSpace.xl,
                    AppSpace.screen,
                    pad.bottom,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                        child: AnimatedOpacity(
                          opacity: _scannar ? 1 : 0,
                          duration: AppMotion.micro,
                          child: Text(
                            'Analyserar hudton och fukt…',
                            style: t.bodySmall?.copyWith(
                              color: AppColors.accentStrong,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpace.lg),
                      GestureDetector(
                        onTap: _scannar ? null : _startScan,
                        child: AnimatedScale(
                          scale: _scannar ? 0.92 : 1,
                          duration: AppMotion.page,
                          curve: AppMotion.curve,
                          child: Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.surface,
                              border: Border.all(
                                color: AppColors.accentStrong.withOpacity(0.3),
                                width: 5,
                              ),
                              boxShadow: AppShadows.cardShadow,
                            ),
                            child: Center(
                              child: _scannar
                                  ? AppAsync.spinner(
                                      radius: 11,
                                      color: AppColors.accentStrong,
                                    )
                                  : const Icon(
                                      LucideIcons.scanFace,
                                      size: 30,
                                      color: AppColors.ink,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpace.lg),
                      Text(
                        _scannar ? 'Håll stilla' : 'Skanna min hud',
                        style: t.titleMedium,
                      ),
                      const SizedBox(height: AppSpace.md),
                      Text(
                        'Resultat och rekommendationer sparas i din profil.',
                        textAlign: TextAlign.center,
                        style: t.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FaceFramePainter extends CustomPainter {
  _FaceFramePainter({required this.puls});

  final double puls;

  @override
  void paint(Canvas canvas, Size size) {
    final bredd = size.width * 0.66;
    final oval = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.38),
      width: bredd,
      height: bredd * 1.34,
    );

    final helaYtan = Path()..addRect(Offset.zero & size);
    final fonstret = Path()..addOval(oval);

    canvas.drawPath(
      Path.combine(PathOperation.difference, helaYtan, fonstret),
      Paint()..color = AppColors.ink.withOpacity(0.45),
    );

    canvas.drawOval(
      oval,
      Paint()
        ..color = AppColors.accentStrong.withOpacity(0.5 + 0.35 * puls)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_FaceFramePainter old) => old.puls != puls;
}
