import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../routes/app_route_paths.dart';
import 'widgets/auth_visual_shell.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );
    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _fadeAnimation = curvedAnimation;
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(curvedAnimation);

    _animationController.forward();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _continueToOtp() {
    final phoneNumber = _phoneController.text.trim();
    final isValidPhoneNumber = RegExp(r'^\d{10}$').hasMatch(phoneNumber);

    if (!isValidPhoneNumber) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit phone number.')),
      );
      return;
    }

    context.go(AppRoutePaths.otp);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AuthVisualShell(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 24,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 48,
                  ),
                  child: Center(
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: AuthContentPanel(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 34, 32, 28),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const AuthLogo(),
                                const AuthIllustration(
                                  icon: Icons.person_add_alt_rounded,
                                ),
                                Text(
                                  'Create Account',
                                  textAlign: TextAlign.center,
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.8,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Start your GymPro workspace with phone verification.',
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 34),
                                TextFormField(
                                  key: const ValueKey('signup_phone_field'),
                                  controller: _phoneController,
                                  enabled: true,
                                  readOnly: false,
                                  autofocus: false,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  cursorColor: AppColors.primary,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    hintStyle: textTheme.bodyLarge?.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.phone_iphone_rounded,
                                    ),
                                    prefixText: '+91 ',
                                    filled: true,
                                    fillColor: AppColors.surface,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.42,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: const BorderSide(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onFieldSubmitted: (_) => _continueToOtp(),
                                ),
                                const SizedBox(height: 24),
                                FilledButton(
                                  onPressed: _continueToOtp,
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text('Sign Up'),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already associated? ',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          context.go(AppRoutePaths.login),
                                      child: const Text('Sign In'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
