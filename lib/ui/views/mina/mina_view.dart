import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../kit.dart';

/// Profil och favoriter — stat band bryter stacken.
class MinaView extends StatelessWidget {
  const MinaView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final pad = tabContentPadding(context);

    return CustomScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(pad.left, pad.top, pad.right, pad.bottom),
          sliver: SliverList.list(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.plateHigh,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/hero-portrait.jpg',
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0.1, -0.3),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpace.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Emma Andersson', style: t.titleLarge),
                        Text('Medlem sedan 2024', style: t.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.section),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpace.lg,
                  horizontal: AppSpace.md,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  boxShadow: AppShadows.cardShadow,
                ),
                child: const Row(
                  children: [
                    _StatBand(label: 'Scanningar', value: '12'),
                    _StatDivider(),
                    _StatBand(label: 'Favoriter', value: '8'),
                    _StatDivider(),
                    _StatBand(label: 'Glow', value: '87'),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.section),
              const SectionHeader(title: 'Favoriter'),
              const SizedBox(height: AppSpace.lg),
              PressableCard(
                padding: const EdgeInsets.all(AppSpace.md),
                onTap: () => AppHaptics.light(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 64,
                      child: PlateImage(
                        asset: 'assets/images/produkt-serum-foundation.jpg',
                        aspectRatio: 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: AppSpace.lg),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dewy Drops Serum Foundation', style: t.titleMedium),
                          Text('Foundation · 375 kr', style: t.bodySmall),
                        ],
                      ),
                    ),
                    const Icon(
                      LucideIcons.heart,
                      size: 20,
                      color: AppColors.accentStrong,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.md),
              PressableCard(
                padding: const EdgeInsets.all(AppSpace.md),
                onTap: () => AppHaptics.light(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 64,
                      child: PlateImage(
                        asset: 'assets/images/produkt-glow-blush.jpg',
                        aspectRatio: 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: AppSpace.lg),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Glow Blush', style: t.titleMedium),
                          Text('Rouge · 295 kr', style: t.bodySmall),
                        ],
                      ),
                    ),
                    const Icon(
                      LucideIcons.heart,
                      size: 20,
                      color: AppColors.accentStrong,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.section),
              const SectionHeader(title: 'Profil'),
              const SizedBox(height: AppSpace.lg),
              const _ProfilRad(
                icon: LucideIcons.scanFace,
                title: 'Hudprofil',
                subtitle: 'Normal · varm underton',
              ),
              const _ProfilRad(
                icon: LucideIcons.bell,
                title: 'Notiser',
                subtitle: 'Produktnyheter och tips',
              ),
              const _ProfilRad(
                icon: LucideIcons.package,
                title: 'Beställningar',
                subtitle: 'Senaste leverans 3 sep',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatBand extends StatelessWidget {
  const _StatBand({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(value, style: t.titleLarge),
          const SizedBox(height: 4),
          Text(label, style: t.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 36,
      child: VerticalDivider(width: 1, color: AppColors.hairline),
    );
  }
}

class _ProfilRad extends StatelessWidget {
  const _ProfilRad({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return PressableCard(
      padding: const EdgeInsets.all(AppSpace.lg),
      onTap: () => AppHaptics.light(),
      child: Row(
        children: [
          Icon(icon, size: 22, color: AppColors.accentStrong),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: t.titleMedium),
                Text(subtitle, style: t.bodySmall),
              ],
            ),
          ),
          const Icon(
            LucideIcons.chevronRight,
            size: 18,
            color: AppColors.inkFaint,
          ),
        ],
      ),
    );
  }
}
