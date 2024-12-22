import 'package:flutter/material.dart';

class UIFadeAnimation extends StatefulWidget {
	final Widget child;
	final Duration? duration;

	const UIFadeAnimation({
		super.key,
		required this.child,
		this.duration
	});

	@override
	State<UIFadeAnimation> createState() => _UIFadeAnimationState();
}

class _UIFadeAnimationState extends State<UIFadeAnimation> with TickerProviderStateMixin {
	late final AnimationController controller;
  late final Animation<double> animation;

	@override
	void initState() {
		super.initState();
		controller = AnimationController(
			duration: widget.duration ?? const Duration(milliseconds: 500),
    	vsync: this,
  	)..forward();

		animation = CurvedAnimation(
    	parent: controller,
    	curve: Curves.easeIn,
  	);
	}

	@override
	void dispose() {
		controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return FadeTransition(
			opacity: animation,
			child: widget.child,
		);
	}
}
