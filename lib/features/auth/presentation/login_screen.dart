import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_paths.dart';

// ConsumerStatefulWidget is used when a screen needs both local widget state
// and access to Riverpod providers. This login screen currently uses local
// state for the phone field, while staying ready for auth providers later.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // TextEditingController lets this screen read, clear, and manage the phone
  // number entered in the TextField without adding business logic yet.
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // dispose() releases the TextEditingController when the screen is removed,
    // preventing memory leaks in long-running production apps.
    _phoneController.dispose();
    super.dispose();
  }

  void _continueToOtp() {
    final phoneNumber = _phoneController.text.trim();
    final isValidPhoneNumber = RegExp(r'^\d{10}$').hasMatch(phoneNumber);

    // Validation keeps the OTP flow safe by allowing only exactly 10 digits
    // before navigation. Invalid input is explained with a SnackBar.
    if (!isValidPhoneNumber) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit phone number.')),
      );
      return;
    }

    // Navigation uses GoRouter so route changes stay centralized, declarative,
    // and easy to protect later with authentication redirects.
    context.go(AppRoutePaths.otp);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxFormWidth = constraints.maxWidth < 480
                ? double.infinity
                : 420.0;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 64,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxFormWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'GP',
                              style: textTheme.headlineSmall?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'GymPro',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sign in to manage your fitness business.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // TextField captures the phone number using a numeric
                        // keyboard, India country prefix, and rounded outline
                        // styling that follows the active Material 3 theme.
                        TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                            hintText: '9876543210',
                            prefixText: '+91 ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                          onSubmitted: (_) => _continueToOtp(),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: _continueToOtp,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text('Continue'),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'By continuing, you agree to GymPro Terms & Privacy.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
