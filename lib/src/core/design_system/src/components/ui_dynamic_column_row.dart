import 'package:flutter/material.dart';

class UIDynamicColumnRow extends StatelessWidget {
	const UIDynamicColumnRow({
		super.key,
		required this.children,
		this.displayLikeRow = false,
		this.mainAxisSize = MainAxisSize.max,
		this.mainAxisAlignment = MainAxisAlignment.start,
		this.crossAxisAlignment = CrossAxisAlignment.center,
		this.textDirection,
		this.verticalDirection,
	});

	final List<Widget> children;
	final MainAxisSize mainAxisSize;
	final MainAxisAlignment mainAxisAlignment;
	final CrossAxisAlignment crossAxisAlignment;
	final bool displayLikeRow;
	final TextDirection? textDirection;
	final VerticalDirection? verticalDirection;

	@override
	Widget build(BuildContext context) {
		return displayLikeRow
			? Row(
				textDirection: textDirection,
				mainAxisSize: mainAxisSize,
				mainAxisAlignment: mainAxisAlignment,
				crossAxisAlignment: crossAxisAlignment,
				children: children,
			)
			: Column(
				textDirection: textDirection,
				verticalDirection: verticalDirection ?? VerticalDirection.down,
				mainAxisSize: mainAxisSize,
				mainAxisAlignment: mainAxisAlignment,
				crossAxisAlignment: crossAxisAlignment,
				children: children,
			);
	}
}
