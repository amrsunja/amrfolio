import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:amrfolio/src/core/utils/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;


@RoutePage()
class ContactPage extends HookWidget {
	const ContactPage({super.key});

	@override
	Widget build(BuildContext context) {
		final locale = AppLocale.of(context)!;
		final scroll = useScrollController();
		final screen = MediaQuery.of(context).size;

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
		return UIScaffold(
		  child: Listener(
				onPointerSignal: isWebMobile ? null : _handlePointerSignal,
		    child: SingleChildScrollView(
					controller: scroll,
					physics: isWebMobile ? null : NeverScrollableScrollPhysics(),
		      child: UIResponsiveBuilder(
		      	builder: (context, constraints, type) {
							final boxWidth = type == UIDeviceScreenType.web ? screen.width * .5 : null;
		      		return ConstrainedBox(
								constraints: BoxConstraints(
									minHeight: screen.height
								),
		      		  child: Stack(
									alignment: Alignment.center,
		      		    children: [
		      		      UIDynamicColumnRow(
		      		      	verticalDirection: type == UIDeviceScreenType.web 
		      		      		? null : VerticalDirection.up,
		      		      	displayLikeRow: type == UIDeviceScreenType.web,
		      		      	children: [
		      		      		Container(
		      		      			color: UIColorToken.neu200,
		      		      		  constraints: BoxConstraints(
		      		      		    minHeight: screen.height,
		      		      		  ),
		      		      			width: boxWidth,
													child: Column(
														mainAxisAlignment: MainAxisAlignment.center,
													  children: [
															UIText(
																locale.contact_page_meet_title.toUpperCase(),
																style: GoogleFonts.vastShadow(
																	fontSize: type == UIDeviceScreenType.web ? 25 : 20
																),
															),
													    UIImage.asset(
													    	image: Assets.street,
													    	boxFit: BoxFit.contain,
													    ),
													  ],
													),
		      		      		),
		      		      		Container(
													padding: EdgeInsets.symmetric(
														horizontal: screen.width * (type == UIDeviceScreenType.web ? .1 : .12)
													),
		      		      			color: UIColorToken.neu900,
													constraints: BoxConstraints(
														minHeight: screen.height,
													),
		      		      			width: boxWidth,
													child: Column(
														mainAxisAlignment: MainAxisAlignment.center,
														crossAxisAlignment: CrossAxisAlignment.start,
														children: [
															UIText(
																locale.contact_page_title,
																style: GoogleFonts.kodchasan(
																	fontSize: 40,
																	color: UIColorToken.neu0
																),
															),

															SizedBox(height: 30),
															UIText(
																locale.contact_page_subtitle,
																style: GoogleFonts.kodchasan(
																	fontSize: 20,
																	color: UIColorToken.pri400
																),
															),
															SizedBox(height: screen.width * .4),
															Row(
																mainAxisAlignment: MainAxisAlignment.center,
																spacing: 40,
																children: [
																	UIIcon(
																		'assets/icons/linkedin.svg',
																		size: 30,
																		onTap: () {
																			html.window.open('https://www.linkedin.com/in/amrsunja', '_blank');
																		},
																	),
																	UIIcon(
																		'assets/icons/GitHub.svg',
																		size: 30,
																		onTap: () {
																			html.window.open('https://github.com/amrsunja', '_blank');
																		},
																	),
																	UIIcon(
																		'assets/icons/mail.svg',
																		size: 30,
																		onTap: () {
																			html.window.open('mailto:coder.ozdoamir@gmail.com', '_self');
																		},
																	),
																	UIIcon(
																		'assets/icons/telegram.svg',
																		size: 30,
																		onTap: () {
																			html.window.open('https://t.me/amrsunja', '_blank');
																		},
																	),
																],
															)
														],
													),
		      		      		),
		      		      	],
		      		      ),
										Center(child: UIText(
											'🤝',
											style: GoogleFonts.kodchasan(
												fontSize: screen.width * (type == UIDeviceScreenType.web ? .05 : .2),
											),
										))
		      		    ],
		      		  ),
		      		);
		      	}
		      ),
		    ),
		  ),
		);
	}
}
