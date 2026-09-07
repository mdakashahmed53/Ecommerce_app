import 'dart:ui';

import 'package:ecommerce_app/app/ecommerce_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };


  runApp(const EcommerceApp());
}


  /// problem list

 /// app bar theme kaz kore nah
 /// add to cart korte gele invalid product id aase
 /// popular product section kaz kore nah
 /// product screen show kore nah
 /// popular section kaz kore




// Initialize FVM -> Done
// Folder structure -> Done
// Firebase Set up -> Done
// Crashlytics -> Done
// Analytics -> Done
// Theming ->
// Localization ->
// Provider ->