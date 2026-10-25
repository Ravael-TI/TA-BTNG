import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;

  // Input controller bersih tanpa teks default
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const Color primaryGreen = Color(0xFF54A847);
  static const Color textDark = Color(0xFF191D23);
  static const Color textMuted = Color(0xFF8E96A4);
  static const Color inputBorderColor = Color(0xFFEAEDF0);
  static const Color lightBg = Color(0xFFF6F7F9);

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            width: screenSize.width * 0.65,
            height: screenSize.height * 0.38,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.75, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/vegetables.png',
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: const Color(0xFFF0F8EE)),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  _buildLogo(),
                  const SizedBox(height: 28),
                  const Text('Welcome to VegBox', style: TextStyle(fontSize: 16, color: textMuted)),
                  const SizedBox(height: 6),
                  const Text('Get started now', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: textDark, height: 1.22)),
                  const SizedBox(height: 28),
                  _buildTabSwitcher(),
                  const SizedBox(height: 26),
                  _buildInputLabel('Full name'),
                  const SizedBox(height: 8),
                  _buildFullNameField(),
                  const SizedBox(height: 18),
                  _buildInputLabel('Phone number'),
                  const SizedBox(height: 8),
                  _buildPhoneField(),
                  const SizedBox(height: 18),
                  _buildInputLabel('Set password'),
                  const SizedBox(height: 8),
                  _buildPasswordField(),
                  const SizedBox(height: 24),
                  // Tombol Register -> Masuk ke HomePage
                  _buildSubmitButton('Register', () {
                    Navigator.pushReplacementNamed(context, '/home');
                  }),
                  const SizedBox(height: 26),
                  _buildDivider('Or register with'),
                  const SizedBox(height: 22),
                  _buildSocialButtons(),
                  const SizedBox(height: 32),
                  _buildTermsAndConditions(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F8F1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCF0D8), width: 1),
      ),
      child: const Center(child: Icon(Icons.inventory_2_rounded, color: primaryGreen, size: 26)),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: lightBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: inputBorderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginPage(),
                    transitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text('Login', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textMuted)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              alignment: Alignment.center,
              child: const Text('Register', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textDark)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textDark));
  }

  Widget _buildFullNameField() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: inputBorderColor)),
      child: TextField(
        controller: _fullNameController,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textDark),
        decoration: InputDecoration(
          hintText: 'masukkan nama lengkap',
          hintStyle: const TextStyle(color: textMuted),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icon/full_name_icon.png', width: 20, height: 20, errorBuilder: (_, __, ___) => const Icon(Icons.person_outline, color: primaryGreen, size: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: inputBorderColor)),
      child: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textDark),
        decoration: InputDecoration(
          hintText: 'masukkan nomor telepon',
          hintStyle: const TextStyle(color: textMuted),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icon/phone_number_icon.png', width: 20, height: 20, errorBuilder: (_, __, ___) => const Icon(Icons.stay_current_portrait_rounded, color: primaryGreen, size: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: inputBorderColor)),
      child: TextField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textDark, letterSpacing: 2.0),
        decoration: InputDecoration(
          hintText: '••••••••',
          hintStyle: const TextStyle(color: textMuted, letterSpacing: 0),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icon/password_icon.png', width: 20, height: 20, errorBuilder: (_, __, ___) => const Icon(Icons.lock_outline_rounded, color: primaryGreen, size: 20)),
              ],
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: primaryGreen, size: 22),
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildDivider(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFEAEDF0), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(text, style: const TextStyle(fontSize: 12, color: textMuted)),
        ),
        const Expanded(child: Divider(color: Color(0xFFEAEDF0), thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        Expanded(child: _buildSocialCard('Google', 'assets/icon/google_icon.png')),
        const SizedBox(width: 14),
        Expanded(child: _buildSocialCard('Apple', 'assets/icon/apple_icon.png')),
      ],
    );
  }

  Widget _buildSocialCard(String label, String iconPath) {
    return InkWell(
      onTap: () => Navigator.pushReplacementNamed(context, '/home'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: inputBorderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 20, height: 20, errorBuilder: (_, __, ___) => const Icon(Icons.circle, size: 20, color: textDark)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(fontSize: 12, height: 1.5, color: textMuted, fontFamily: 'Poppins'),
          children: [
            const TextSpan(text: 'By signing up, you agree to the '),
            TextSpan(text: 'Terms of Service', style: const TextStyle(fontWeight: FontWeight.w700, color: textDark), recognizer: TapGestureRecognizer()..onTap = () {}),
            const TextSpan(text: ' and '),
            TextSpan(text: '\nData Processing Agreement', style: const TextStyle(fontWeight: FontWeight.w700, color: textDark), recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
      ),
    );
  }
}