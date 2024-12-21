import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../src/features/web_app.dart';


/// To run app									- .runApplication
abstract class AppRunner {
	static void runWebApp() => _run(const WebApp());

	static void _run(Widget child) => runApp(ProviderScope(child: child));
}
