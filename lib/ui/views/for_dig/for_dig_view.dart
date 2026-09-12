import 'package:flutter/material.dart';

import '../../../data/products.dart';
import '../../common/app_colors.dart';
import '../../common/app_haptics.dart';
import '../../common/app_shadows.dart';
import '../../common/app_space.dart';
import '../../kit.dart';

/// Rekommendationer — 2×2 wrap med distinkta produktbilder.
class ForDigView extends StatelessWidget {
  const ForDigView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final pad = tabContentPadding(context);
    final items = caiaProducts.take(6).toList();

    return CustomScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(pad.left, pad.top, pad.right, pad.bottom),
          sliver: SliverList.list(
            children: [
              Text('För dig', style: t.displayLarge),
              const SizedBox(height: AppSpace.sm),
              Text(
                'Produkter som passar din hudtyp och underton.',
                style: t.bodySmall,
              ),
              const SizedBox(height: AppSpace.section),
              PressableCard(
                padding: const EdgeInsets.all(AppSpace.lg),
                onTap: () => AppHaptics.light(),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Senaste resultat', style: t.titleMedium),
                          const SizedBox(height: 4),
                          Text(
                            'Kombination hud · normal · varm underton',
                            style: t.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpace.md,
                        vertical: AppSpace.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.plateHigh,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text('94%', style: t.titleMedium),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpace.section),
              SectionHeader(title: 'Rekommendationer'),
              const SizedBox(height: AppSpace.lg),
              LayoutBuilder(
                builder: (context, constraints) {
                  final gap = AppSpace.md;
                  final cellW = (constraints.maxWidth - gap) / 2;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (final p in items)
                        SizedBox(
                          width: cellW,
                          child: _ProductTile(product: p),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpace.section),
              Text('Varför dessa?', style: t.titleLarge),
              const SizedBox(height: AppSpace.md),
              Text(
                'Vi matchar formula, finish och nyans mot din senaste '
                'ansiktsscanning. Uppdatera med Hudscan när din hud förändras.',
                style: t.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final CaiaProduct product;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => AppHaptics.light(),
      child: Container(
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
              aspectRatio: 1,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpace.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: t.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: t.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${product.match}% · ${product.price} kr',
                    style: t.bodySmall?.copyWith(color: AppColors.accentStrong),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
