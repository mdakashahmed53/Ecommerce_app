// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get version => 'Version';

  @override
  String get signUpSubTitle => 'Create an account with details';

  @override
  String get createAccount => 'Create New Account';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get otpSubTitle => 'Enter the OTP sent to your email';

  @override
  String get otpExpire => 'This code will expire in ';

  @override
  String get resendCode => 'Resent OTP';

  @override
  String get welcome => 'Welcome Back';

  @override
  String get inputEmail => 'Please Enter Your Email Address';

  @override
  String get submitOtp => 'Verify';
}
