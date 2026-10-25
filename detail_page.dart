import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic>? product;

  const DetailPage({super.key, this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _quantity = 1;
  bool _isExpanded = false;

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF8E96A4);
  static const Color borderColor = Color(0xFFEAEDF0);
  static const Color discountRed = Color(0xFFEF4444);
  static const Color lightGreenBadge = Color(0xFFD7EED6);

  @override
  Widget build(BuildContext context) {
    final product = widget.product ?? {
      'name': 'Green Leaf Lettuce',
      'pack': '450-500gr /pack',
      'price': '\$40.00',
      'originalPrice': '\$50.00',
      'discount': '20%',
      'image': 'assets/images/product_4.png',
      'description':
          'In terms of quality, look for well-marbled tenderloin, where fat is interspersed within the muscle. This marbling enhances the flavor and juiciness when cooked. A high-quality tenderloin should have a vibrant red color with a fine grain. When...',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    // Tombol Back
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_rounded, color: primaryGreen, size: 18),
                            SizedBox(width: 5),
                            Text('Back', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: textDark)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Gambar Utama Produk
                    Center(
                      child: SizedBox(
                        height: 260,
                        child: Image.asset(
                          product['image'] ?? 'assets/images/product_4.png',
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.eco_rounded, size: 120, color: primaryGreen),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product['name'] ?? 'Green Leaf Lettuce',
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: textDark, letterSpacing: -0.3),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['pack'] ?? '450-500gr /pack',
                      style: const TextStyle(fontSize: 13, color: textMuted),
                    ),
                    const SizedBox(height: 16),
                    // Baris Harga, Diskon & Selector Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(color: discountRed, borderRadius: BorderRadius.circular(6)),
                              child: Text(product['discount'] ?? '20%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white)),
                            ),
                            const SizedBox(width: 10),
                            Text(product['price'] ?? '\$40.00', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: primaryGreen)),
                            const SizedBox(width: 8),
                            Text(
                              product['originalPrice'] ?? '\$50.00',
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: discountRed, decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (_quantity > 1) setState(() => _quantity--);
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: borderColor, width: 1.5)),
                                child: const Icon(Icons.remove, size: 16, color: textMuted),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text('$_quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: textDark)),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () => setState(() => _quantity++),
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(color: lightGreenBadge, borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.add, size: 18, color: primaryGreen),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Deskripsi
                    const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textDark)),
                    const SizedBox(height: 8),
                    Text(
                      product['description'] ?? '',
                      maxLines: _isExpanded ? null : 3,
                      overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: textMuted, height: 1.55),
                    ),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_isExpanded ? 'Show less' : 'Show more', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: primaryGreen)),
                          const SizedBox(width: 2),
                          Icon(_isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, size: 16, color: primaryGreen),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: borderColor, thickness: 1),
                  ],
                ),
              ),
            ),
            // Tombol Add to Cart Bawah
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: borderColor))),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$_quantity ${product['name']} berhasil ditambahkan ke keranjang!'), backgroundColor: primaryGreen),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon/cart.png', width: 20, height: 20, color: Colors.white, errorBuilder: (_, __, ___) => const Icon(Icons.shopping_basket_rounded, color: Colors.white, size: 20)),
                      const SizedBox(width: 8),
                      const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}