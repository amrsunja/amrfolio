import 'dart:async';

import 'package:flutter/material.dart';

import 'config/app_runner.dart';

void main() {
	runZonedGuarded<Future<void>>(
		() async {
			WidgetsFlutterBinding.ensureInitialized();

  		AppRunner.runWebApp();

		}, (error, stack) {

		}
	);
}
