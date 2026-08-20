import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension UtilityExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  TextTheme get textTheme => TextTheme.of(this);
}