import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF8E96A4);
  static const Color borderColor = Color(0xFFEAEDF0);
  static const Color iconBlueBg = Color(0xFFA4C2FA);

  final List<Map<String, dynamic>> _transactions = const [
    {
      'title': 'Currency exchange',
      'subtitle': null,
      'id': '698094554317',
      'amount': '\$ 350.00',
      'status': 'pending',
      'date': '17 Sep 2023',
      'time': '11:21 AM',
      'icon': Icons.sync_rounded,
    },
    {
      'title': 'Cash-in',
      'subtitle': 'From ABC Bank ATM',
      'id': '564925374920',
      'amount': '\$ 100.00',
      'status': 'confirmed',
      'date': '17 Sep 2023',
      'time': '10:34 AM',
      'icon': Icons.credit_card_rounded,
    },
    {
      'title': 'Cashback from purchase',
      'subtitle': 'Purchase from Amazon.com',
      'id': '685746354219',
      'amount': '\$ 1.75',
      'status': 'confirmed',
      'date': '16 Sep 2023',
      'time': '16:08 PM',
      'icon': Icons.shopping_cart_rounded,
    },
    {
      'title': 'Transfer to card',
      'subtitle': null,
      'id': '698094554317',
      'amount': '\$ 9000.00',
      'status': 'confirmed',
      'date': '16 Sep 2023',
      'time': '11:21 AM',
      'icon': Icons.credit_card_outlined,
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 16, bottom: 110),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Center(
                    child: Text('History',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: textDark)),
                  ),
                  const SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _transactions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final item = _transactions[index];
                      final bool isPending = item['status'] == 'pending';
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 6,
                                offset: const Offset(0, 2)),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  color: iconBlueBg,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Icon(item['icon'] as IconData,
                                  color: Colors.white, size: 26),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'] as String,
                                      style: const TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w700,
                                          color: textDark,
                                          height: 1.2)),
                                  if (item['subtitle'] != null) ...[
                                    const SizedBox(height: 2),
                                    Text(item['subtitle'] as String,
                                        style: const TextStyle(
                                            fontSize: 12, color: textMuted)),
                                  ],
                                  const SizedBox(height: 6),
                                  const Text('Transaction ID',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFFA0AEC0))),
                                  const SizedBox(height: 1),
                                  Text(item['id'] as String,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: textDark)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(item['amount'] as String,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: textDark)),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: isPending
                                        ? const Color(0xFFFEF3C7)
                                        : const Color(0xFFD1FAE5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item['status'] as String,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: isPending
                                          ? const Color(0xFFD97706)
                                          : const Color(0xFF059669),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text('${item['date']}  ${item['time']}',
                                    style: const TextStyle(
                                        fontSize: 10.5, color: textMuted)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: const BottomNavBar(currentIndex: 3),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBottomNav(BuildContext context) {
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
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            icon: Image.asset('assets/icon/home_active.png',
                width: 22,
                height: 22,
                color: textMuted,
                errorBuilder: (_, __, ___) => const Icon(Icons.home_outlined,
                    color: textMuted, size: 22)),
          ),
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
          // History Tab Active
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/history_active.png',
                  width: 22,
                  height: 22,
                  color: primaryGreen,
                  errorBuilder: (_, __, ___) => const Icon(Icons.description,
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
