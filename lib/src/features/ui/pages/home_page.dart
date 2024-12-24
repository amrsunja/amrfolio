import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:amrfolio/src/core/utils/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';


@RoutePage()
class HomePage extends StatelessWidget {
	const HomePage({super.key});

	@override
	Widget build(BuildContext context) {
		final screen = MediaQuery.of(context).size;
		final theme = AppTheme.of(context);
		final locale = AppLocale.of(context)!;
		return UIResponsiveBuilder(
		  builder: (context, constraints, type) {
		    return ConstrainedBox(
		    	constraints: BoxConstraints(
		    		minHeight: screen.height
		    	),
		      child: Padding(
		        padding: EdgeInsets.symmetric(horizontal: screen.width * .1),
		        child: Stack(
		        	alignment: type == UIDeviceScreenType.web ? Alignment.center : Alignment.topCenter,
		          children: [
		    				// Background images
		    				UIDynamicColumnRow(
		    					displayLikeRow: type == UIDeviceScreenType.web,
		    					mainAxisAlignment: MainAxisAlignment.end,
		    					crossAxisAlignment: CrossAxisAlignment.start,
		    					children: [
		    						UIDynamicColumnRow(
		    							crossAxisAlignment: CrossAxisAlignment.end,
		    							children: [
		    								UIImage.asset(
		                			height: type == UIDeviceScreenType.web ? screen.width / 13 : 80,
		    									boxFit: BoxFit.contain,
		    									maxHeight: 100,
		    									image: Assets.birds
		    								),
		    								UIImage.asset(
		                			height: type == UIDeviceScreenType.web ? screen.width / 7 : 150,
		    									maxHeight: 250,
		    									image: Assets.towns
		    								),
		    							],
		    						),
										SizedBox(height: 150),
		    						UIImage.asset(
		    							height: type == UIDeviceScreenType.web ? screen.width / 1.8 : 800,
		    							image: Assets.sphetofor
		    						),
		    					],
		    				),
		    				Row(
		              children: [
		                Column(
		                	crossAxisAlignment: CrossAxisAlignment.start,
		                	children: [
		                		SizedBox(height: 200),
		                		UIText(
		                			locale.home_page_title.toUpperCase(),
		                			style: GoogleFonts.vastShadow(
		                				fontSize: screen.width * (type == UIDeviceScreenType.web ? 0.04 : 0.06),
		                			),
		                		).animate(
		                			effects: [FadeEffect(duration: 1.seconds)],
		                			delay: .7.seconds
		                		),
		                
		                		Column(
		                			children: [
		                				Container(
															padding: EdgeInsets.symmetric(
																horizontal: 20
															),
		                					decoration: BoxDecoration(
		                						color: theme.colors.txtColor,
		                						borderRadius: BorderRadius.circular(20)
		                					),
		                					child: Row(
		                						children: [
		                							UIText(
		                								locale.home_page_subtitle.toUpperCase(),
		                								color: theme.colors.bgColor,
		                								style: GoogleFonts.vastShadow(
		                									fontSize: screen.width * (type == UIDeviceScreenType.web ? 0.05 : 0.07),
		                								),
		                							),
		                							UIText(
		                								'_'.toUpperCase(),
		                								color: theme.colors.bgColor,
		                								style: GoogleFonts.vastShadow(
		                									fontSize: screen.width * (type == UIDeviceScreenType.web ? 0.05 : 0.07),
		                								),
		                							).animate(
		                								effects: [FadeEffect(duration: .5.seconds)],
		                								onPlay: (controller) {
		                									controller.repeat();
		                								}
		                							),
		                						],
		                					)
		                				),
		                				UIText(
		                					locale.home_page_subsubtitle.toUpperCase(),
		                					style: GoogleFonts.kodchasan(
		                						fontSize: type == UIDeviceScreenType.web ? screen.width * 0.012 : 13,
		                						fontWeight: FontWeight.w800
		                					),
		                				),
		                				SizedBox(height: 5),
		                			],
		                		).animate(
		                				effects: [FadeEffect(duration: 1.seconds)],
		                				delay: .2.seconds
		                		).slideX(curve: Curves.fastEaseInToSlowEaseOut)
		                	],
		                ),
		              ],
		            ),
		          ],
		        ).animate(
							effects: [FadeEffect(duration: 1.seconds)],
							delay: .5.seconds
						),
		      ),
		    );
		  }
		);
	}
}
