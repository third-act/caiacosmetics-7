class CaiaProduct {
  const CaiaProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.match,
  });

  final String id;
  final String name;
  final String category;
  final int price;
  final String image;
  final int match;
}

const caiaProducts = <CaiaProduct>[
  CaiaProduct(
    id: 'dewy-concealer',
    name: 'Dewy Drops Serum Concealer',
    category: 'Concealer',
    price: 295,
    image: 'assets/images/produkt-dewy-concealer.jpg',
    match: 96,
  ),
  CaiaProduct(
    id: 'soft-brush',
    name: 'Soft Blend Brush F27',
    category: 'Borste',
    price: 225,
    image: 'assets/images/produkt-soft-brush.jpg',
    match: 88,
  ),
  CaiaProduct(
    id: 'serum-foundation',
    name: 'Dewy Drops Serum Foundation',
    category: 'Foundation',
    price: 375,
    image: 'assets/images/produkt-serum-foundation.jpg',
    match: 94,
  ),
  CaiaProduct(
    id: 'wake-me-up',
    name: 'Wake Me Up Cream',
    category: 'Color Corrector',
    price: 295,
    image: 'assets/images/produkt-wake-me-up.jpg',
    match: 91,
  ),
  CaiaProduct(
    id: 'glow-blush',
    name: 'Glow Blush',
    category: 'Rouge',
    price: 295,
    image: 'assets/images/produkt-glow-blush.jpg',
    match: 89,
  ),
  CaiaProduct(
    id: 'lip-balm',
    name: 'Soft Melt Peptide Lip Balm',
    category: 'Läppar',
    price: 245,
    image: 'assets/images/produkt-lip-balm.jpg',
    match: 85,
  ),
  CaiaProduct(
    id: 'bronzer',
    name: 'Glow Bronzer',
    category: 'Bronzer',
    price: 395,
    image: 'assets/images/produkt-bronzer.jpg',
    match: 87,
  ),
];
