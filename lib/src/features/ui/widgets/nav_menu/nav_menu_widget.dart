import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/design_system/src/components/ui_big_button.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:amrfolio/src/features/ui/widgets/nav_menu/nav_menu_button.dart';
import 'package:flutter/material.dart';

class NavMenuWidget extends StatelessWidget {
	const NavMenuWidget({
		super.key,
		required this.selectedItemIndex,
		required this.onChange,
	});

	final int selectedItemIndex;
	final Function(int index) onChange;

	@override
	Widget build(BuildContext context) {
		final locale = AppLocale.of(context)!;
		return Padding(
			padding: const EdgeInsets.symmetric(
				vertical: 25,
				horizontal: 40
			),
		  child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
		    children: [
					Expanded(
						child: SizedBox.shrink()
					),
		      Flexible(
						flex: 4,
		        child: Row(
		        	mainAxisAlignment: MainAxisAlignment.spaceEvenly,
		        	children: [
		        		NavMenuButton(
		        			label: locale.home,
									isSelected: selectedItemIndex == 0,
									onTap: () => onChange(0),
		        		),
		        		NavMenuButton(
		        			label: locale.projects,
									isSelected: selectedItemIndex == 1,
									onTap: () => onChange(1),
		        		),
		        		NavMenuButton(
		        			label: locale.about,
									isSelected: selectedItemIndex == 2,
									onTap: () => onChange(2),
		        		),
		        		NavMenuButton(
		        			label: locale.contact,
									isSelected: selectedItemIndex == 3,
									onTap: () => onChange(3),
		        		),
		        	],
		        ),
		      ),
					Expanded(
						child: SizedBox.shrink()
					),
					UIBigButton.outlined(
						label: 'CV',
						onTap: () {
						}
					),
		    ],
		  ),
		);
	}
}
