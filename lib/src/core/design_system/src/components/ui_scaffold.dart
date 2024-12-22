import 'package:flutter/material.dart';

import '../../app_ui.dart';

class UIScaffold extends StatelessWidget {
	final Widget? child;
	final PreferredSizeWidget? appBar;
	final Color? bgColor;
	final Color? dismissingBgColor;
	final Widget? bottomNavigationBar;
	final Widget? floatingActionButton;
	final bool resizeToAvoidBottomInset;
	final bool extendBodyBehindAppBar;
	final bool extendBody;
	final bool dismissPageDisabled;
	final FloatingActionButtonLocation? floatingButtonLocation;
	final VoidCallback? onDismissPage;

	const UIScaffold({
		super.key,
		this.child,
		this.appBar,
		this.bgColor,
		this.dismissingBgColor,
		this.bottomNavigationBar,
		this.floatingActionButton,
		this.extendBody = false,
		this.resizeToAvoidBottomInset = false,
		this.extendBodyBehindAppBar = false,
		this.dismissPageDisabled = false,
		this.floatingButtonLocation,
		this.onDismissPage,
	});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			extendBody: extendBody,
			extendBodyBehindAppBar: extendBodyBehindAppBar,
			resizeToAvoidBottomInset: resizeToAvoidBottomInset,
			backgroundColor: bgColor ?? AppTheme.of(context).colors.bgColor,
			appBar: appBar,
			body: child,
			bottomNavigationBar: bottomNavigationBar,
			floatingActionButton: floatingActionButton,
			floatingActionButtonLocation: floatingButtonLocation,
		);
	}
}
