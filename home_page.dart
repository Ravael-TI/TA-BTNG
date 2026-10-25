import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;

  // 1. Kategori yang sudah diperbarui
  final List<String> _categories = [
    'All',
    'Vegetables',
    'Fruits',
  ];

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color darkGreenBanner = Color(0xFF2E7D32);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF8E96A4);
  static const Color borderColor = Color(0xFFEAEDF0);
  static const Color lightGreenBadge = Color(0xFFD7EED6);

  // 2. Daftar 4 Produk Lengkap
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Carrot',
      'pack': '500gr - 1kg /pack',
      'price': '\$24.00',
      'originalPrice': '\$30.00',
      'discount': '20%',
      'image': 'assets/images/product_1.png',
      'description':
          'Sweet, crunchy, and freshly harvested organic carrots packed with beta-carotene, vitamin A, and fiber. Perfect for fresh juices, salads, roasting, or healthy daily snacks.',
    },
    {
      'name': 'Cabbage',
      'pack': '800gr - 1kg /piece',
      'price': '\$18.00',
      'originalPrice': '\$25.00',
      'discount': '28%',
      'image': 'assets/images/product_2.png',
      'description':
          'Tightly packed, crisp green cabbage harvested from premium organic farms. Rich in dietary fiber, potassium, and vitamin C. Ideal for stir-fries, fresh slaw, and hearty soups.',
    },
    {
      'name': 'Corn',
      'pack': '2-3 pcs /pack',
      'price': '\$15.00',
      'originalPrice': '\$20.00',
      'discount': '25%',
      'image': 'assets/images/product_3.png',
      'description':
          'Delicious farm-fresh sweet golden corn. Plump, juicy kernels bursting with natural sweetness. Great for grilling, boiling, or making homemade corn soup and salads.',
    },
    {
      'name': 'Green leaf lettuce',
      'pack': '450-500gr /pack',
      'price': '\$40.00',
      'originalPrice': '\$50.00',
      'discount': '20%',
      'image': 'assets/images/product_4.png',
      'description':
          'In terms of quality, look for well-marbled tenderloin, where fat is interspersed within the muscle. This marbling enhances the flavor and juiciness when cooked. A high-quality tenderloin should have a vibrant red color with a fine grain. When...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderBanner(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _buildSearchBar(),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Categories',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: textDark)),
                        Row(
                          children: [
                            Text('See all',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: primaryGreen)),
                            SizedBox(width: 2),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 12, color: primaryGreen),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildCategoryList(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _buildProductGrid(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: const BottomNavBar(currentIndex: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderBanner() {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 220,
            child: Image.asset(
              'assets/images/people.png',
              fit: BoxFit.contain,
              alignment: Alignment.topRight,
              errorBuilder: (_, __, ___) => const SizedBox(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Deliver to',
                    style: TextStyle(fontSize: 12, color: textMuted)),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: borderColor),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 4,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.location_on, color: primaryGreen, size: 16),
                      SizedBox(width: 4),
                      Text("Leavar's Home",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: textDark)),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          size: 18, color: textDark),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text('Pay Day\nShop Day',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: darkGreenBanner,
                        height: 1.15)),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text('Voucher\nup to',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4A5568),
                            height: 1.1)),
                    SizedBox(width: 8),
                    Text('75',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: darkGreenBanner)),
                    Text('%',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: darkGreenBanner)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What's your daily needs?",
                hintStyle: TextStyle(fontSize: 13, color: textMuted),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Icon(Icons.search_rounded, color: primaryGreen, size: 22),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return InkWell(
            onTap: () {
              // Kategori bisa diklik, produk di bawahnya tetap tidak berubah
              setState(() => _selectedCategoryIndex = index);
            },
            borderRadius: BorderRadius.circular(18),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? lightGreenBadge : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? textDark : textMuted,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.76,
      ),
      itemBuilder: (context, index) {
        final product = _products[index];
        return InkWell(
          // Klik kartu untuk membuka Detail Page
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(product: product)),
            );
          },
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                          Icons.eco_rounded,
                          size: 48,
                          color: primaryGreen),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        product['name']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: textDark,
                            height: 1.2),
                      ),
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: lightGreenBadge,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.add_rounded,
                          color: primaryGreen, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingBottomNav() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 1. Home Active
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/home_active.png',
                  width: 22,
                  height: 22,
                  color: primaryGreen,
                  errorBuilder: (_, __, ___) => const Icon(Icons.home_filled,
                      color: primaryGreen, size: 22)),
              const SizedBox(height: 3),
              Container(
                  width: 6,
                  height: 3,
                  decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(2))),
            ],
          ),
          // 2. Notification
          IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/notification'),
            icon: Image.asset('assets/icon/notification_active.png',
                width: 22,
                height: 22,
                color: textMuted,
                errorBuilder: (_, __, ___) => const Icon(
                    Icons.notifications_none_rounded,
                    color: textMuted)),
          ),
          // 3. Center Cart Button
          Transform.translate(
            offset: const Offset(0, -6),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: primaryGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: primaryGreen.withOpacity(0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ],
              ),
              child: Center(
                child: Image.asset('assets/icon/cart.png',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                    errorBuilder: (_, __, ___) => const Icon(
                        Icons.shopping_basket_rounded,
                        color: Colors.white,
                        size: 24)),
              ),
            ),
          ),
          // 4. History
          IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/history'),
            icon: Image.asset('assets/icon/history.png',
                width: 22,
                height: 22,
                color: textMuted,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.description_outlined, color: textMuted)),
          ),
          // 5. Profile
          IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/profile'),
            icon: Image.asset('assets/icon/profile.png',
                width: 22,
                height: 22,
                color: textMuted,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person_outline_rounded, color: textMuted)),
          ),
        ],
      ),
    );
  }
}
