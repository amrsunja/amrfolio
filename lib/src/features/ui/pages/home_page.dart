import 'package:amrfolio/src/core/design_system/app_ui.dart';
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
		return ConstrainedBox(
			constraints: BoxConstraints(
				minHeight: screen.height
			),
		  child: Padding(
		    padding: EdgeInsets.symmetric(horizontal: screen.width * .1),
		    child: Stack(
		    	alignment: Alignment.center,
		      children: [
						// Background images
						Row(
							mainAxisAlignment: MainAxisAlignment.end,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Column(
									crossAxisAlignment: CrossAxisAlignment.end,
									children: [
										UIImage.asset(
											height: screen.width / 13,
											boxFit: BoxFit.contain,
											maxHeight: 100,
											image: Assets.birds
										),
										UIImage.asset(
											height: screen.width / 6,
											maxHeight: 250,
											image: Assets.towns
										),
									],
								),
								UIImage.asset(
									height: screen.width /  1.8,
									image: Assets.sphetofor
								),
							],
						),
						Row(
		          children: [
		            Column(
		            	crossAxisAlignment: CrossAxisAlignment.start,
		            	children: [
		            		SizedBox(height: 100),
		            		UIText(
		            			'Full\nStack'.toUpperCase(),
		            			style: GoogleFonts.vastShadow(
		            				fontSize: screen.width * 0.04
		            			),
		            		).animate(
		            			effects: [FadeEffect(duration: 2.seconds)],
		            			delay: 1.seconds
		            		),
		            
		            		Column(
		            			crossAxisAlignment: CrossAxisAlignment.end,
		            			children: [
		            				UIText(
		            					'WEB / MOBILE',
		            					style: GoogleFonts.kodchasan(
		            						fontSize: 16,
		            						fontWeight: FontWeight.w800
		            					),
		            				),
		            				SizedBox(height: 5),
		            				Container(
		            					padding: EdgeInsets.all(15),
		            					decoration: BoxDecoration(
		            						color: theme.colors.txtColor,
		            						borderRadius: BorderRadius.circular(20)
		            					),
		            					child: Row(
		            						children: [
		            							UIText(
		            								'Developer'.toUpperCase(),
		            								color: theme.colors.bgColor,
		            									style: GoogleFonts.vastShadow(
		            																	fontSize: screen.width * 0.05
		            								),
		            							),
		            							UIText(
		            								'_'.toUpperCase(),
		            								color: theme.colors.bgColor,
		            								style: GoogleFonts.vastShadow(
		            									fontSize: screen.width * 0.05
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
		            			],
		            		).animate(
		            				effects: [FadeEffect(duration: 2.seconds)],
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
}
