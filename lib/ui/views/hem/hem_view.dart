import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../data/products.dart';
import '../../kit.dart';
import '../../splash/splash_view.dart';

/// Hem: dominant photo hero + supporting blocks over the fold.
class HemView extends StatelessWidget {
  const HemView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final pad = tabContentPadding(context);
    final featured = caiaProducts.take(4).toList();

    return CustomScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(pad.left, pad.top, pad.right, 0),
          sliver: SliverList.list(
            children: [
              const BrandMark(height: 24),
              const SizedBox(height: AppSpace.section),
              Text('Hej Emma', style: t.displayLarge),
              const SizedBox(height: AppSpace.sm),
              Text(
                'Din hud ser utsökt idag — här är dagens glow.',
                style: t.bodySmall,
              ),
              const SizedBox(height: AppSpace.lg),
              PressableCard(
                padding: EdgeInsets.zero,
                onTap: () => AppHaptics.light(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScrimImage(
                      asset: 'assets/images/hero-portrait.jpg',
                      aspectRatio: 4 / 3,
                      alignment: const Alignment(0.1, -0.25),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppRadius.card),
                      ),
                      overlay: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Glow-index',
                            style: t.labelSmall?.copyWith(
                              color: AppColors.onAccent.withOpacity(0.85),
                            ),
                          ),
                          Text(
                            '87',
                            style: t.displayLarge?.copyWith(
                              fontSize: 56,
                              color: AppColors.onAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(AppSpace.lg),
                      child: Row(
                        children: [
                          _StatChip(label: 'Fukt', value: '72'),
                          SizedBox(width: AppSpace.md),
                          _StatChip(label: 'Jämnhet', value: '81'),
                          SizedBox(width: AppSpace.md),
                          _StatChip(label: 'Lyster', value: '87'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.lg),
              Row(
                children: [
                  Expanded(
                    child: PressableCard(
                      padding: const EdgeInsets.all(AppSpace.lg),
                      onTap: () => AppHaptics.light(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            LucideIcons.scanFace,
                            size: 22,
                            color: AppColors.accentStrong,
                          ),
                          const SizedBox(height: AppSpace.md),
                          Text('Hudscan', style: t.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            'Uppdatera din profil',
                            style: t.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpace.md),
                  Expanded(
                    child: PressableCard(
                      padding: const EdgeInsets.all(AppSpace.lg),
                      onTap: () => AppHaptics.light(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            LucideIcons.sparkles,
                            size: 22,
                            color: AppColors.accentStrong,
                          ),
                          const SizedBox(height: AppSpace.md),
                          Text('För dig', style: t.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            '4 nya matchningar',
                            style: t.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.section),
              const SectionHeader(title: 'Matchat för din hud'),
              const SizedBox(height: AppSpace.sm),
              Text(
                'Baserat på din senaste scanning.',
                style: t.bodySmall,
              ),
              const SizedBox(height: AppSpace.lg),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SnapCarousel(
            itemCount: featured.length,
            height: 310,
            viewportFraction: 0.76,
            itemBuilder: (context, i) => _ProductRailCard(product: featured[i]),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            pad.left,
            AppSpace.section,
            pad.right,
            pad.bottom,
          ),
          sliver: SliverList.list(
            children: [
              PressableCard(
                padding: const EdgeInsets.all(AppSpace.lg),
                onTap: () => AppHaptics.light(),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Copenhagen is glowing', style: t.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            'Besök vår nya butik på Købmagergade 32.',
                            style: t.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpace.md),
                    const SizedBox(
                      width: 88,
                      child: PlateImage(
                        asset: 'assets/images/hero-store.jpg',
                        aspectRatio: 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpace.md,
          horizontal: AppSpace.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.plateHigh,
          borderRadius: BorderRadius.circular(AppRadius.image),
        ),
        child: Column(
          children: [
            Text(value, style: t.titleLarge),
            Text(label, style: t.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _ProductRailCard extends StatelessWidget {
  const _ProductRailCard({required this.product});

  final CaiaProduct product;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(right: AppSpace.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlateImage(
            asset: product.image,
            aspectRatio: 1.15,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: t.titleMedium, maxLines: 2),
                const SizedBox(height: 4),
                Text(
                  '${product.match}% match · ${product.price} kr',
                  style: t.bodySmall?.copyWith(color: AppColors.accentStrong),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
