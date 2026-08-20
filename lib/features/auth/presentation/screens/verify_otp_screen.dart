import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_prams.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/resend_otp_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/app_logo.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/resend_otp_section.dart';
import 'package:ecommerce_app/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  static const String name = '/verify-otp';
  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  PinInputController _pinInputController = PinInputController();

  final ResendOtpProvider _resendOtpProvider = ResendOtpProvider();

  final VeifyOtpProvider _veifyOtpProvider = VeifyOtpProvider();

  @override
  void initState() {
    // TODO: implement initState
    _resendOtpProvider.startResendOtpTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _resendOtpProvider),
        ChangeNotifierProvider.value(value: _veifyOtpProvider),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 8,
                children: [
                  const SizedBox(height: 16),
                  AppLogo(height: 100, width: 100),
                  const SizedBox(height: 6),
                  Text(
                    context.localizations.verifyOtp,
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    context.localizations.otpSubTitle,
                    style: context.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),

                  MaterialPinField(
                    length: 4,
                    pinController: _pinInputController,
                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.outlined,
                      cellSize: Size(56, 64),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Consumer<VeifyOtpProvider>(
                    builder: (context, _, _) {
                      if (_veifyOtpProvider.verifyOtpProgress) {
                        return CenteredProgressIndicator();
                      }

                      return FilledButton(
                        onPressed: _onTapOtpVerify,
                        child: Text(context.localizations.submitOtp),
                      );
                    },
                  ),
                  ResendOtpSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapOtpVerify() {
    if (_pinInputController.text.length == 4) {
      otpVeify();
    } else {
      showSnackBarMessage(context, 'Please Input Valid OTP');
    }
  }

  Future otpVeify() async {
    bool isSuccess = await _veifyOtpProvider.verifyOtp(
      VerifyOtpPrams(email: widget.email, otp: _pinInputController.text),
    );

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (_) => false,
      );
    } else {
      showSnackBarMessage(context, _veifyOtpProvider.errorMessage!);
    }
  }

  void _onTapOTPResentButton() {}

  @override
  void dispose() {
    super.dispose();
  }
}
