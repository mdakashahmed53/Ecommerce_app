import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:ecommerce_app/app/exentension/validators.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_prams.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/sing_in_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/app_logo.dart';
import 'package:ecommerce_app/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sing-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SingInProvider _singInProvider = SingInProvider();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _singInProvider,
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
                    const SizedBox(height: 32),
                    AppLogo(height: 100, width: 100),
                    const SizedBox(height: 6),
                    Text(
                      context.localizations.signIn,
                      style: context.textTheme.titleLarge,
                    ),

                    Text(
                      context.localizations.welcome,
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
                      keyboardType: .visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      textInputAction: .done,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (input) => Validators.validatePassword(input),
                    ),

                    SizedBox(height: 16),

                    Consumer<SingInProvider>(
                      builder: (context, _,_) {
                        if(_singInProvider.signInProgress){
                          return CenteredProgressIndicator();
                        }

                        return FilledButton(
                          onPressed: _onTapSignIn,
                          child: Text(context.localizations.signIn),
                        );
                      }
                    ),

                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          context.localizations.createAccount,
                          style: context.textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: _onTapSignUpButton,
                          child: Text(context.localizations.signUp),
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

  void _onTapSignIn() {
    if (_formKey.currentState!.validate()) {
      signIn();
    } else {
      showSnackBarMessage(context, 'Please Input email & password');
    }
  }

  Future<void> signIn() async {
    bool isSuccess = await _singInProvider.singIn(
      SignInPrams(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (_) => false,
      );
    } else {
      showSnackBarMessage(context, _singInProvider.errorMessage);
    }
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
