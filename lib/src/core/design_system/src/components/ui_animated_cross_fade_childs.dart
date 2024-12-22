import 'package:flutter/material.dart';

class UIAnimatedCrossFadeChilds extends StatelessWidget {
	final CrossFadeState state;
	final Widget firstChild;
	final Widget secondChild;

	const UIAnimatedCrossFadeChilds({
		super.key,
		required this.state,
		required this.firstChild,
		required this.secondChild,
	});

	@override
	Widget build(BuildContext context) {
		return AnimatedCrossFade(
			duration: Durations.long4,
			firstChild: firstChild,
			secondChild: secondChild,
			crossFadeState: state,
		);
	}
}
