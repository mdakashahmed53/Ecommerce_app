import 'package:ecommerce_app/app/app_theme.dart';
import 'package:ecommerce_app/app/providers/locale_provider.dart';
import 'package:ecommerce_app/app/providers/theme_provider.dart';
import 'package:ecommerce_app/app/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/providers/resend_otp_provider.dart';
import 'package:ecommerce_app/features/splash/screens/splash_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  final LocaleProvider _localeProvider = LocaleProvider();
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _localeProvider.init();
    _localeProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _localeProvider),
        ChangeNotifierProvider.value(value: _themeProvider),
        ChangeNotifierProvider(create: (_)=>ResendOtpProvider()),
        ChangeNotifierProvider(create: (_)=>MainNavHolderProvider()),


      ],
      child: Consumer<ThemeProvider>(
        builder: (context, _, _) {
          return Consumer<LocaleProvider>(
            builder: (context, _, _) {
              return MaterialApp(
                navigatorKey: EcommerceApp.navigatorKey,
                title: 'Ecommerce App',
                debugShowCheckedModeBanner: false,
                // home: SignUpScreen(),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: _themeProvider.currentThemeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: _localeProvider.supportedLocales,
                locale: _localeProvider.currentLocale,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: SplashScreen.name,
              );
            },
          );
        },
      ),
    );
  }
}
