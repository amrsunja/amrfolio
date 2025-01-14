import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
	const ProjectsPage({super.key});

	@override
	Widget build(BuildContext context) {
		final screen = MediaQuery.of(context).size;
		final theme = AppTheme.of(context);
		final locale = AppLocale.of(context)!;
		return ConstrainedBox(
			constraints: BoxConstraints(
				minHeight: screen.height
			),
		  child: Center(
		  	child: Text('Projects Page'),
		  ),
		);
	}
}
