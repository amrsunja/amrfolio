import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';
import 'route_paths.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next();
  }

	@override
	//.material, .cupertino, .adaptive, .custom
	RouteType get defaultRouteType => RouteType.custom(
		opaque: false,
		barrierDismissible: true,
		reverseDurationInMilliseconds: 400,
		barrierColor: Colors.transparent,
		transitionsBuilder: (context, anim1, anim2, child) => CupertinoPageTransition(
			primaryRouteAnimation: anim1,
			secondaryRouteAnimation: anim2,
			linearTransition: false,
			child: child,
		),
	);     

	/// General we use this route builder to enable opaque value wich is setted like true by default 
	CustomRoute customRoute({
		required PageInfo<dynamic> page,
		String? path,
		Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionsBuilder = TransitionsBuilders.slideLeftWithFade,
		int durationInMilliseconds = 300,
		bool initial = false,
	}) => CustomRoute(
		page: page,
		path: path,
		initial: initial,
		transitionsBuilder: transitionsBuilder,
		durationInMilliseconds: durationInMilliseconds
	);

	@override
	List<AutoRoute> get routes => [
		// HOME PAGE -----------------------------------------------------------
		CustomRoute(
			path: RoutePaths.home,
			page: HomeRoute.page,
			durationInMilliseconds: 1200,
			transitionsBuilder: (context, anim, secondAnim, child) {
				anim = CurvedAnimation(
					parent: anim,
					curve: Curves.fastLinearToSlowEaseIn,
					reverseCurve: Curves.fastOutSlowIn
				);
				return ScaleTransition(
					scale: anim,
					alignment: Alignment.bottomCenter,
					child: child,
				);
			},
			children: [
			]
		)
	];
}
