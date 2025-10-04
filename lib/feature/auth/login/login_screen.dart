import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8BBD0),
                Color(0xFFFFE0E9),
                Color(0xFFFCE4EC),
                Color(0xFFFFCDD2),
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: responsive.padding(24),
                child: ResponsiveContainer(
                  maxWidth: responsive.responsiveValue(
                    mobile: responsive.screenWidth,
                    tablet: 500,
                    desktop: 600,
                  ),
                  padding: EdgeInsets.zero,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo/Avatar
                        Container(
                          width: responsive.responsiveValue(
                            mobile: 120,
                            tablet: 140,
                            desktop: 160,
                          ),
                          height: responsive.responsiveValue(
                            mobile: 120,
                            tablet: 140,
                            desktop: 160,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFE91E63), Color(0xFFF06292)],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE91E63).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.dashboard_rounded,
                            size: responsive.iconSize(60),
                            color: Colors.white,
                          ),
                        ),
                        responsive.heightBox(30),

                        // Title
                        Text(
                          'تسجيل الدخول',
                          style: GoogleFonts.cairo(
                            fontSize: responsive.fontSize(32),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF880E4F),
                          ),
                        ),
                        responsive.heightBox(10),

                        Text(
                          'لوحة التحكم',
                          style: GoogleFonts.cairo(
                            fontSize: responsive.fontSize(18),
                            color: const Color(0xFF880E4F).withOpacity(0.6),
                          ),
                        ),
                        responsive.heightBox(40),

                        // Login Card
                        Container(
                          padding: responsive.padding(30),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(
                              responsive.borderRadius(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email Field
                              Text(
                                'البريد الإلكتروني',
                                style: GoogleFonts.cairo(
                                  fontSize: responsive.fontSize(14),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF880E4F).withOpacity(0.7),
                                ),
                              ),
                              responsive.heightBox(8),

                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: const Color(0xFF880E4F),
                                  fontSize: responsive.fontSize(16),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'أدخل بريدك الإلكتروني',
                                  hintStyle: GoogleFonts.cairo(
                                    color: const Color(0xFF880E4F).withOpacity(0.3),
                                    fontSize: responsive.fontSize(14),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: const Color(0xFFE91E63).withOpacity(0.7),
                                    size: responsive.iconSize(24),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE91E63),
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: responsive.paddingSymmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال البريد الإلكتروني';
                                  }
                                  if (!value.contains('@')) {
                                    return 'الرجاء إدخال بريد إلكتروني صحيح';
                                  }
                                  return null;
                                },
                              ),
                              responsive.heightBox(20),

                              // Password Field
                              Text(
                                'كلمة المرور',
                                style: GoogleFonts.cairo(
                                  fontSize: responsive.fontSize(14),
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF880E4F).withOpacity(0.7),
                                ),
                              ),
                              responsive.heightBox(8),

                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                style: TextStyle(
                                  color: const Color(0xFF880E4F),
                                  fontSize: responsive.fontSize(16),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'أدخل كلمة المرور',
                                  hintStyle: GoogleFonts.cairo(
                                    color: const Color(0xFF880E4F).withOpacity(0.3),
                                    fontSize: responsive.fontSize(14),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: const Color(0xFFE91E63).withOpacity(0.7),
                                    size: responsive.iconSize(24),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xFFE91E63).withOpacity(0.7),
                                      size: responsive.iconSize(24),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE91E63),
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: responsive.paddingSymmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال كلمة المرور';
                                  }
                                  if (value.length < 6) {
                                    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                                  }
                                  return null;
                                },
                              ),
                              responsive.heightBox(15),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle forgot password
                                  },
                                  child: Text(
                                    'نسيت كلمة المرور؟',
                                    style: GoogleFonts.cairo(
                                      color: const Color(0xFFE91E63),
                                      fontSize: responsive.fontSize(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              responsive.heightBox(25),

                              // Login Button
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Handle login
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'جاري تسجيل الدخول...',
                                          style: GoogleFonts.cairo(),
                                        ),
                                        backgroundColor: const Color(0xFFE91E63),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: responsive.paddingSymmetric(
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFE91E63), Color(0xFFF06292)],
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      responsive.borderRadius(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFFE91E63).withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: responsive.fontSize(18),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        responsive.heightBox(30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}