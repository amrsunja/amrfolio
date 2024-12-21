import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../observers/navigation_observer.dart';

final navigationObserverProvider = Provider<NavigationObserver>(
	(ref) => NavigationObserver()
);
