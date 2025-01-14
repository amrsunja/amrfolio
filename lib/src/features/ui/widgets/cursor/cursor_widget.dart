import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CursorWidget extends HookWidget {
	const CursorWidget({super.key});

	@override
	Widget build(BuildContext context) {
		final theme = AppTheme.of(context);
		final cursorPosition = useState(Offset.zero);
		final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
		return MouseRegion(
			hitTestBehavior: HitTestBehavior.translucent, // Allow gestures to pass through
			onHover:(event) {
				if (isWebMobile) return;
				cursorPosition.value = event.position;
			},
			child: Stack(
			  children: [
			    AnimatedPositioned(
			    	left: cursorPosition.value.dx - 30,
			    	top: cursorPosition.value.dy - 30,
			    	duration: Durations.long4,
			    	curve: Curves.fastLinearToSlowEaseIn,
			    	child: IgnorePointer(
			    		ignoring: true,
			    		child: Container(
			    			height: 60,
			    			width: 60,
			    			decoration: BoxDecoration(
			    				borderRadius: BorderRadius.all(Radius.circular(100)),
			    				border: Border.all(
			    					width: 1,
			    					color: theme.colors.cursorColor,
			    					style: BorderStyle.solid
			    				)
			    			),
			    		),
			    	),
			    ),
			  ],
			),
		);
	}
}
