import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillItemWidget extends StatelessWidget {
	const SkillItemWidget({
		super.key,
		required this.title,
		required this.icon
	});

	final String title;
	final String icon;

	@override
	Widget build(BuildContext context) {
		final screen = MediaQuery.of(context).size;
		return UIResponsiveBuilder(
		  builder: (context, _, type) {
		    return Row(
		    	mainAxisSize: MainAxisSize.min,
		    	crossAxisAlignment: CrossAxisAlignment.center,
		    	children: [
		    		UIIcon(
		    			icon,
		    			size: screen.width * (type == UIDeviceScreenType.web ? .02 : .055),
		    		),

		    		SizedBox(width: 5),
		    		UIText(
		    			title,
		    			style: GoogleFonts.kodchasan(
		    			fontSize: screen.width * (type == UIDeviceScreenType.web ? .01 : .03),
		    			color: UIColorToken.neu0,
		    			),
		    		)
		    	]
				).animate(
						effects: [FadeEffect(duration: 2.seconds)],
						delay: .8.seconds
				).slideX(
					curve: Curves.fastEaseInToSlowEaseOut,
					duration: 3.seconds
				);
		  }
		);
	}
}
