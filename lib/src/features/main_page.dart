import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:amrfolio/src/features/ui/pages/about_page.dart';
import 'package:amrfolio/src/features/ui/pages/contact_page.dart';
import 'package:amrfolio/src/features/ui/pages/home_page.dart';
import 'package:amrfolio/src/features/ui/pages/projects_page.dart';
import 'package:amrfolio/src/features/ui/widgets/cursor/cursor_widget.dart';
import 'package:amrfolio/src/features/ui/widgets/nav_menu/nav_menu_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


@RoutePage()
class MainPage extends HookWidget {
	const MainPage({super.key});


	TextStyle? getFabMenuItemStyle(bool isSelected) {
		return GoogleFonts.kodchasan(
			fontSize: 16,
			fontWeight: FontWeight.bold,
			color: isSelected ? UIColorToken.pri800 : UIColorToken.neu400,
		);
	}


	@override
	Widget build(BuildContext context) {
		final theme = AppTheme.of(context);
		final scroll = useScrollController();
		final liquidController = useMemoized(() {
			return LiquidController();
		});
		final currentPage = useState(liquidController.currentPage);

		void _handlePointerSignal(PointerSignalEvent event) {
			if (event is PointerScrollEvent) {
				// Calculate the new target offset
				final newOffset = (scroll.offset + event.scrollDelta.dy * 5).clamp(
          scroll.position.minScrollExtent,
          scroll.position.maxScrollExtent,
        );

				// Animate smoothly to the new offset
				scroll.animateTo(
					newOffset,
					curve: Curves.fastEaseInToSlowEaseOut,
					duration: Duration(seconds: 1)
				);
			}
		}

		final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
		final locale = AppLocale.of(context)!;
		return UIResponsiveBuilder(
		  builder: (context, constraints, screenType) {
		    return UIScaffold(
		      child: Stack(
						children: [
							LiquidSwipe(
								enableLoop: false,
								liquidController: liquidController,
								positionSlideIcon: 0.9,
								onPageChangeCallback: (page) {
									currentPage.value = page;
								},
							  pages: [
							    Listener(
							      onPointerSignal: isWebMobile ? null : _handlePointerSignal,
							      child: Container(
											color: theme.colors.bgColor,
							        child: ListView(
							        	controller: scroll,
							        	physics: isWebMobile ? null : NeverScrollableScrollPhysics(),
												children: [
													HomePage(),
													ProjectsPage(),
													AboutPage(),
												],
											),
							      ),
							    ),
									ContactPage(),
							  ],
							),

							NavMenuWidget(
								pageTitle: currentPage.value == 0 ? locale.contact : locale.home,
								onPageChange: () {
									if (currentPage.value == 0)
										liquidController.animateToPage(page: 1);
									else liquidController.animateToPage(page: 0);
								},
							),
			
							if (!isWebMobile)
								CursorWidget()
						],
		      ),
		    );
		  }
		);
	}
}
