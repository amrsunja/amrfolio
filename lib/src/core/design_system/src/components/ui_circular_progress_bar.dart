import 'package:flutter/material.dart';

import '../../app_ui.dart';


class UICircularProgressBar extends StatelessWidget {
	final Color? color;
	final double? size;

	const UICircularProgressBar({
		super.key,
		this.color,
		this.size
	});

	@override
	Widget build(BuildContext context) {
		final _size = size ?? UIGridToken.remToPx(1.5);
		return SizedBox(
			height: _size,
			width: _size,
			child: CircularProgressIndicator(
				color: color ?? UIColorToken.pri800,
				strokeWidth: 1,
			),
		);
	}
}
