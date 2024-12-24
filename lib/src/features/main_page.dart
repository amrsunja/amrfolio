import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/features/ui/pages/about_page.dart';
import 'package:amrfolio/src/features/ui/pages/contact_page.dart';
import 'package:amrfolio/src/features/ui/pages/home_page.dart';
import 'package:amrfolio/src/features/ui/pages/projects_page.dart';
import 'package:amrfolio/src/features/ui/widgets/nav_menu/nav_menu_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

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
		final selectedPageIndex = useState(0);
		final cursorPosition = useState(Offset.zero);
		final scroll = useScrollController();
		final scrollToId = useMemoized(() => ScrollToId(
			scrollController: scroll
		));


		useEffect(() {
			scrollToId.scrollController?.addListener(() {
				final idPosition = int.parse(scrollToId.idPosition() ?? '0');

				if (idPosition != selectedPageIndex.value)
					selectedPageIndex.value = idPosition;
			});

			return null;
		});

		void onScrollToId(int id) {
			scrollToId.animateTo(
				id.toString(),
				duration: Durations.medium3,
				curve: Curves.fastOutSlowIn
			);
		}

		final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
		return UIResponsiveBuilder(
		  builder: (context, constraints, screenType) {
		    return UIScaffold(
		    	floatingActionButton: screenType == UIDeviceScreenType.web ? null : UIFabMenu(
						overlayColor: theme.colors.bgColor,
						overlayOpacity: 0.9,
						fabAlignment: Alignment.bottomRight,
						closeMenuButton: Icon(
							Icons.close_rounded,
							color: theme.colors.txtColor,
						),
						fabIcon: Icon(
							Icons.menu_rounded,
							color: theme.colors.txtColor,
						),
						fabBackgroundColor: theme.colors.bgColor,
		    		child: NavMenuWidget(
							verticalAlignment: true,
							selectedItemIndex: selectedPageIndex.value,
							onChange: (index) {
								context.router.maybePop();
								onScrollToId(index);
							},
						)
		    	),
		      child: MouseRegion(
		    		//cursor: SystemMouseCursors.none,
		      	hitTestBehavior: HitTestBehavior.translucent, // Allow gestures to pass through
		    		onHover:(event) {
							if (isWebMobile) return;
		    			cursorPosition.value = event.position;
		    		},
		        child: Stack(
		    			children: [
		    				InteractiveScrollViewer(
		    					scrollToId: scrollToId,
		    					children: [
		    						ScrollContent(
		    							id: '0',
		    							child: HomePage()
		    						),
		    						ScrollContent(
		    							id: '1',
		    							child: ProjectsPage()
		    						),
		    						ScrollContent(
		    							id: '2',
		    							child: AboutPage()
		    						),
		    						ScrollContent(
		    							id: '3',
		    							child: ContactPage()
		    						),
		    					],
		    				),

								UIAnimatedCrossFadeChilds(
									state: screenType == UIDeviceScreenType.web ? CrossFadeState.showFirst : CrossFadeState.showSecond,
									firstChild: NavMenuWidget(
										selectedItemIndex: selectedPageIndex.value,
										onChange: (index) {
											onScrollToId(index);
										},
									),
									secondChild: SizedBox.shrink(),
								),
		    
								if (!isWebMobile)
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
		      ),
		    );
		  }
		);
	}
}
