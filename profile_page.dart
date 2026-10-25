import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF8E96A4);
  static const Color borderColor = Color(0xFFEAEDF0);

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
                    child: Text('Profile',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: textDark)),
                  ),
                  const SizedBox(height: 24),
                  // Kartu Profil (Leavar - Regular Member)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: textDark, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 8,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFF1F5F9),
                            border: Border.all(color: borderColor),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/people.png',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Color(0xFF64748B)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Leavar',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: textDark),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Regular Member',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: textMuted),
                              ),
                            ],
                          ),
                        ),
                        // Tombol Panah Hitam (Kembali ke Login)
                        InkWell(
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, '/login'),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: textDark,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.arrow_forward_rounded,
                                color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Menu List
                  _buildMenuItem(
                    icon: Icons.article_outlined,
                    title: 'Edit Profile',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Menu Edit Profile dipilih'))),
                  ),
                  const Divider(color: borderColor, height: 1),
                  _buildMenuItem(
                    icon: Icons.access_time_rounded,
                    title: 'Settings',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menu Settings dipilih'))),
                  ),
                  const Divider(color: borderColor, height: 1),
                  _buildMenuItem(
                    icon: Icons.help_outline_rounded,
                    title: 'Faq',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menu Faq dipilih'))),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: const BottomNavBar(currentIndex: 4),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: [
            Icon(icon, color: textDark, size: 22),
            const SizedBox(width: 16),
            Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: textDark))),
            const Icon(Icons.chevron_right_rounded, color: textMuted, size: 20),
          ],
        ),
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
          // Profile Tab Active
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/profile_active.png',
                  width: 22,
                  height: 22,
                  color: primaryGreen,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.person, color: primaryGreen, size: 22)),
              const SizedBox(height: 3),
              Container(
                  width: 6,
                  height: 3,
                  decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(2))),
            ],
          ),
        ],
      ),
    );
  }
}
