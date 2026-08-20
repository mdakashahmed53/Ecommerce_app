import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/resend_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({super.key});



  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ResendOtpProvider>(
        builder: (context, resendOtp, _) {
          return Column(
            children: [

              Visibility(
                visible: resendOtp.isTimerRunning,
                replacement: TextButton(onPressed: _onTapResendButton, child: Text(context.localizations.resendCode)),
                child: RichText(text: TextSpan(
                    style: TextStyle(color: Colors.black54),
                    children: [
                  TextSpan(text: 'Resend OTP after '),
                  TextSpan(text: "${resendOtp.resendOtpTimer}s",
                      style: TextStyle(color: AppColors.themeColor)
                  ),
                ])),
              )
            ],
          );
        }
    );
  }

  void _onTapResendButton()async{
    context.read<ResendOtpProvider>().startResendOtpTimer();
  }
}
