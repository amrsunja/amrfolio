import 'package:flutter/material.dart';

class UIDynamicColumnRow extends StatelessWidget {
	const UIDynamicColumnRow({
		super.key,
		required this.children,
		this.displayLikeRow = false,
		this.mainAxisSize = MainAxisSize.max,
		this.mainAxisAlignment = MainAxisAlignment.start,
		this.crossAxisAlignment = CrossAxisAlignment.center,
	});

	final List<Widget> children;
	final MainAxisSize mainAxisSize;
	final MainAxisAlignment mainAxisAlignment;
	final CrossAxisAlignment crossAxisAlignment;
	final bool displayLikeRow;

	@override
	Widget build(BuildContext context) {
		return displayLikeRow
			? Row(
				mainAxisSize: mainAxisSize,
				mainAxisAlignment: mainAxisAlignment,
				crossAxisAlignment: crossAxisAlignment,
				children: children,
			)
			: Column(
				mainAxisSize: mainAxisSize,
				mainAxisAlignment: mainAxisAlignment,
				crossAxisAlignment: crossAxisAlignment,
				children: children,
			);
	}
}
