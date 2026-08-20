import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:ecommerce_app/app/providers/auth_controller.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/providers/locale_provider.dart';
import '../../../app/providers/theme_provider.dart';
import '../../auth/presentation/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>_moveToNextScreen()async{
    await Future.delayed(Duration(seconds: 2));
    if(await AuthController.isLoggedIn()){
      Navigator.pushNamedAndRemoveUntil(context, MainNavHolderScreen.name, (_)=>false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (_)=>false);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.light_mode_rounded)),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Spacer(),
                AppLogo(),
                LocaleChangerDropdown(),
                ThemeChangerDropdown(),

                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.name);
                  },
                  icon: Icon(Icons.arrow_circle_right),
                ),
                CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('${context.localizations.version}. 1.0.0'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocaleChangerDropdown extends StatelessWidget {
  const LocaleChangerDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        return DropdownButton<Locale>(
          value: localeProvider.currentLocale,
          items: localeProvider.supportedLocales.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.languageCode.toUpperCase()),
            );
          }).toList(),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              localeProvider.changeLocale(newLocale);
            }
          },
        );
      },
    );
  }
}

class ThemeChangerDropdown extends StatelessWidget {
  const ThemeChangerDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return DropdownButton<ThemeMode>(
          value: themeProvider.currentThemeMode,
          items: themeProvider.themeModes.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.toString().toUpperCase()),
            );
          }).toList(),
          onChanged: (ThemeMode? newThemeMode) {
            if (newThemeMode != null) {
              themeProvider.changeThemeMode(newThemeMode);
            }
          },
        );
      },
    );
  }
}
