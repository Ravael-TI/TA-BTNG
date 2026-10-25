import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color borderColor = Color(0xFFEAEDF0);
  static const Color avatarBg = Color(0xFFF0F2F4);
  static const Color unreadGreen = Color(0xFF22C55E);

  final List<Map<String, dynamic>> _notifications = const [
    {
      'title':
          "Exciting news! There's a fresh freelance opportunity waiting for you. Don't miss o...",
      'time': '1h ago',
      'isUnread': true,
      'icon': Icons.mail_rounded,
    },
    {
      'title':
          "Hey there! You've got a new message waiting for you. Open it now to stay...",
      'time': '2h ago',
      'isUnread': false,
      'icon': Icons.mail_outline_rounded,
    },
    {
      'title':
          "Great news! We've just added new freelance opportunities that match your...",
      'time': '3h ago',
      'isUnread': false,
      'icon': Icons.mail_outline_rounded,
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
                  left: 24, right: 24, top: 16, bottom: 110),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text('Notification',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: textDark)),
                  ),
                  const SizedBox(height: 24),
                  const Text('Today',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: textDark)),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _notifications.length,
                    separatorBuilder: (_, __) =>
                        const Divider(color: borderColor, height: 1),
                    itemBuilder: (context, index) {
                      final item = _notifications[index];
                      final bool isUnread = item['isUnread'] as bool;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: const BoxDecoration(
                                      color: avatarBg, shape: BoxShape.circle),
                                  child: Icon(item['icon'] as IconData,
                                      color: textDark, size: 22),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: isUnread
                                          ? unreadGreen
                                          : const Color(0xFF9CA3AF),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'] as String,
                                      style: const TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w700,
                                          color: textDark,
                                          height: 1.35)),
                                  const SizedBox(height: 5),
                                  Text(item['time'] as String,
                                      style: const TextStyle(
                                          fontSize: 12, color: textMuted)),
                                ],
                              ),
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
            child: const BottomNavBar(currentIndex: 1),
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
          // Notification Tab Active
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/notification_active.png',
                  width: 22,
                  height: 22,
                  color: primaryGreen,
                  errorBuilder: (_, __, ___) => const Icon(Icons.notifications,
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
