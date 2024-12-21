import 'package:flutter/material.dart';

import '../../app_ui.dart';

class UIIcon extends StatelessWidget {
	final String assetIcon;
	final Color? color;
	final double? size;
	final Alignment? alignment;
	final VoidCallback? onTap;

	const UIIcon(
		this.assetIcon, {
		super.key,
		this.color,
		this.size,
		this.alignment,
		this.onTap,
	});

	@override
	Widget build(BuildContext context) {
		return UITap(
			onTap: onTap,
			child: UIIconToken.toIcon(
				assetIcon,
				color: color,
				size: size,
				alignment: alignment
			)
		);
	}
}
