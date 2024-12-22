import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class AboutPage extends StatelessWidget {
	const AboutPage({super.key});

	@override
	Widget build(BuildContext context) {
		final screen = MediaQuery.of(context).size;
		return ConstrainedBox(
			constraints: BoxConstraints(
				minHeight: screen.height
			),
		  child: Center(
		  	child: Text('About Page'),
		  ),
		);
	}
}
