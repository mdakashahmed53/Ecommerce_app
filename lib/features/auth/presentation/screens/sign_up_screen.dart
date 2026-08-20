import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:ecommerce_app/app/exentension/validators.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_prams.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/app_logo.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sing-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignUpProvider _signUpProvider = SignUpProvider();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                child: Column(
                  spacing: 8,
                  children: [
                    const SizedBox(height: 16),
                    AppLogo(height: 100, width: 100),
                    const SizedBox(height: 6),
                    Text(
                      context.localizations.signUp,
                      style: context.textTheme.titleLarge,
                    ),

                    Text(
                      context.localizations.signUpSubTitle,
                      style: context.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: .next,
                      keyboardType: .emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: Validators.validateEmail,
                    ),

                    TextFormField(
                      keyboardType: .name,
                      controller: _firstNameController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'First Name'),
                      validator: (input) => Validators.validateText(
                        input,
                        message: 'Enter your first name',
                      ),
                    ),
                    TextFormField(
                      keyboardType: .name,
                      controller: _lastNameController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Last Name'),
                      validator: (input) => Validators.validateText(
                        input,
                        message: 'Enter your last name',
                      ),
                    ),
                    TextFormField(
                      keyboardType: .phone,
                      controller: _mobileController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'Mobile'),
                      validator: (input) =>
                          Validators.validatePhoneNumber(input),
                    ),
                    TextFormField(
                      keyboardType: .text,
                      controller: _cityController,
                      textInputAction: .next,
                      decoration: InputDecoration(hintText: 'City'),
                      validator: (input) => Validators.validateText(
                        input,
                        message: 'Enter your city name',
                      ),
                    ),

                    TextFormField(
                      keyboardType: .visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      textInputAction: .done,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (input) => Validators.validatePassword(input),
                    ),

                    Consumer<SignUpProvider>(
                      builder: (context, _, _) {
                        if (_signUpProvider.signUpProgress) {
                          return CenteredProgressIndicator();
                        }

                        return FilledButton(
                          onPressed: _onTapSignUp,
                          child: Text(context.localizations.signUp),
                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          context.localizations.alreadyHaveAnAccount,
                          style: context.textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: _onTapSignInButton,
                          child: Text(context.localizations.signIn),
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
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      singUp();
    }
  }

  Future<void> singUp() async {
    bool isSuccess = await _signUpProvider.signUp(
      SignUpPrams(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        phone: _mobileController.text.trim(),
        password: _passwordController.text,
        city: _cityController.text.trim(),
      ),
    );

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOTPScreen.name, arguments:_emailController.text.trim() );
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMassage!);
    }
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
