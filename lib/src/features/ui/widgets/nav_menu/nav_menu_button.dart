import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavMenuButton extends StatelessWidget {
	const NavMenuButton({
		super.key,
		required this.label,
		this.isSelected = false,
		this.onTap,
	});

	final String label;
	final bool isSelected;
	final VoidCallback? onTap;

	@override
	Widget build(BuildContext context) {
		return UITap(
		  onTap: onTap,
		  child: Padding(
		    padding: const EdgeInsets.all(5.0),
		    child: AnimatedDefaultTextStyle(
		  	  duration: Durations.medium2,
		  		style: GoogleFonts.kodchasan(
		  			fontSize: 16,
		  			fontWeight: FontWeight.bold,
		  	  	color: isSelected ? UIColorToken.pri800 : UIColorToken.neu400,
		  		),
		  	  child: UIText(
		  	  	label.toUpperCase(),
		  	  ),
		  	),
		  ),
		);
	}
}
