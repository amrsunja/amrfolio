import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef AppLocale = AppLocalizations;

final l10nProvider = Provider<AppLocale>((ref) {
	// 1. initialize from the initial locale
	final locale = L10n.defaultLocale ;

	ref.state = lookupAppLocalizations(locale);
	// 2. create an observer to update the state
	//TODO: Uncomment this code line after creating localSettingsProvider
	//final localSettings = ref.watch(localSettingsProvider).data;


	//TODO: Uncomment this code line after creating localSettingsProvider
	//ref.state = lookupAppLocalizations(localSettings?.locale ?? locale);
	ref.state = lookupAppLocalizations(locale);

	return ref.state;
});


class L10n {
	static Locale get en => all[0];
	static Locale get fr => all[1];

  static final all = [
    const Locale('en', 'US'),
		///This is Galician language, but for us it is Galga language ;)
    const Locale('fr', "FR"),
  ];

	static Locale get defaultLocale => all.contains(ui.PlatformDispatcher.instance.locale)
		? ui.PlatformDispatcher.instance.locale : en;
}

