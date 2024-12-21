import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_router.dart';

final routerProvider = Provider(
	(ref) =>  AppRouter()
);
