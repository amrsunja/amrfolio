import 'package:flutter/material.dart';

abstract class ButtonStyles {
	static ButtonStyle buttonStyle({
		required bool fullWidth,
		BorderSide? border,
		double? maxWidth,
		double? maxHeight,
		required double height,
		double? width,
		Color? bgColor,
		Color? fgColor,
		EdgeInsets? padding,
		BorderRadius? radius,
	}) {
		return ButtonStyle(
			elevation: WidgetStateProperty.all(0),
			overlayColor: WidgetStateProperty.all(fgColor),
			foregroundColor: WidgetStateProperty.all(fgColor),
			backgroundColor: WidgetStateProperty.all(bgColor),
			padding: WidgetStateProperty.all(padding),
			minimumSize: WidgetStateProperty.all(
				Size(
					width ?? (fullWidth ? double.infinity : 2),
					height
				)
			),
			maximumSize: WidgetStateProperty.all(
				Size(
					maxWidth ?? double.infinity,
					maxHeight ?? double.infinity	
				)
			),
			shape: WidgetStateProperty.all(RoundedRectangleBorder(
				side: border ?? BorderSide.none,
				borderRadius: radius ?? BorderRadius.zero
			))
		);
	}
}
