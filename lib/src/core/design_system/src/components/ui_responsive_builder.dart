import 'package:flutter/material.dart';

enum UIDeviceScreenType {mobile, web}

class UIResponsiveBuilder extends StatelessWidget {
	const UIResponsiveBuilder({
		super.key,
		required this.builder
	});

	final Function (BuildContext context, BoxConstraints constraints, UIDeviceScreenType type) builder; 

	@override
	Widget build(BuildContext context) {
		final screen = MediaQuery.of(context).size;
		return LayoutBuilder(
			builder: (context, constraints) {
				late final UIDeviceScreenType type;
				if (screen.width < 904) type = UIDeviceScreenType.mobile;
				else type = UIDeviceScreenType.web;

				return builder(context, constraints, type);
			},
		);
	}
}
