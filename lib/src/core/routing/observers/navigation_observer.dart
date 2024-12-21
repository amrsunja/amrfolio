import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class NavigationObserver extends AutoRouterObserver {
  static final Expando<NavigatorState> _navigators = Expando<NavigatorState>();

	@override
	NavigatorState? get navigator => _navigators[this];

	// new route pushed
  @override                
  void didPush(Route route, Route? previousRoute) {                
  }

	// Tab route visited
 	@override                
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {                
  }                

	// Tab route re-visited
  @override                
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {                
  }                
}
