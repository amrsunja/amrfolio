import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/design_system/src/components/ui_big_button.dart';
import 'package:flutter/material.dart';

class NavMenuWidget extends StatelessWidget {
	const NavMenuWidget({
		super.key,
		required this.pageTitle,
		this.onPageChange,
	});

	final String pageTitle;
	final VoidCallback? onPageChange;

	@override
	Widget build(BuildContext context) {
		final buttons = [
			UIBigButton.primary(
				label: pageTitle,
				onTap: onPageChange
			),
			SizedBox(width: 10,),
			UIBigButton.outlined(
				label: 'CV',
				onTap: () {
				}
			)
		];

		return Padding(
			padding: const EdgeInsets.symmetric(
				vertical: 25,
				horizontal: 40
			),
			child:Row(
				mainAxisAlignment: MainAxisAlignment.end,
				children: buttons
			),
		);
	}
}
