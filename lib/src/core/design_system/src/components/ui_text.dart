import 'package:flutter/material.dart';

import '../../app_ui.dart';

class UIText extends StatelessWidget {
	final String text;
	final Color? color;
	final TextStyle? style;
	final TextAlign? textAlign;
	final TextOverflow? overFlow;
	final int? maxLines;
	final double? fontSize;

	const UIText(
		this.text, {
		super.key,
		this.color,
		this.style,
		this.textAlign,
		this.overFlow,
		this.maxLines,
		this.fontSize,
	});

	@override
	Widget build(BuildContext context) {
		final theme = AppTheme.of(context);
		final defaultTextColor = theme.colors.bgColor.computeLuminance() > 0.5 ? UIColorToken.neu900 : UIColorToken.pri0;
		return Text(
			text,
			textAlign: textAlign,
			overflow: overFlow,
			maxLines: maxLines,
			style: style?.copyWith(
				fontSize: fontSize,
				color: color ?? defaultTextColor
			)
		);
	}
}
