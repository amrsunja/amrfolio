import 'package:flutter/material.dart';

import '../../app_ui.dart';


class UITap extends StatelessWidget {
	const UITap({
		super.key,
		this.onTap,
		this.splashEffect = false,
		this.child,
		this.onHover
	});

	final VoidCallback? onTap;
	final Widget? child;
	final bool splashEffect;
	final Function(bool)? onHover;

	@override
	Widget build(BuildContext context) {
		final color = splashEffect ? UIColorToken.neu200 : Colors.transparent;
		return Material(
			color: Colors.transparent,
		  child: InkWell(
				onHover: onHover,
		  	onTap: onTap,
		  	highlightColor: color,
		  	splashColor: color,
		  	hoverColor: color,
		  	child: child,
		  ),
		);
	}
}
