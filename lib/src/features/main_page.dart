import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/features/ui/pages/about_page.dart';
import 'package:amrfolio/src/features/ui/pages/contact_page.dart';
import 'package:amrfolio/src/features/ui/pages/home_page.dart';
import 'package:amrfolio/src/features/ui/pages/projects_page.dart';
import 'package:amrfolio/src/features/ui/widgets/nav_menu/nav_menu_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

@RoutePage()
class MainPage extends HookWidget {
	const MainPage({super.key});

	@override
	Widget build(BuildContext context) {
		final selectedPageIndex = useState(0);
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


		return UIScaffold(
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
					NavMenuWidget(
						selectedItemIndex: selectedPageIndex.value,
						onChange: (index) {
							scrollToId.animateTo(
								index.toString(),
								duration: Durations.short3,
								curve: Curves.fastOutSlowIn
							);
						},
					),
				],
		  ),
		);
	}
}
