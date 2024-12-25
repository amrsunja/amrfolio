import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_ui.dart';


class UIBigButton extends StatelessWidget {
	final String label;
	final String? assetIcon;
	final VoidCallback? onTap;
	final Color bgColor;
	final Color fgColor;
	final Color contentColor;
	final bool disabled;
	final bool isBusy;
	final bool fullWidth;
	final UIItemPosition? iconPosition;
	final BorderSide border;

	const UIBigButton.primary({
		super.key,
		required this.label,
		this.assetIcon,
		this.disabled = false,
		this.isBusy = false,
		this.fullWidth = false,
		this.iconPosition = UIItemPosition.left,
		this.onTap
	}) : bgColor = UIColorToken.pri800,
			 fgColor = UIColorToken.pri900,
			 contentColor = UIColorToken.neu0,
			 border = BorderSide.none;

	const UIBigButton.secondary({
		super.key,
		required this.label,
		this.assetIcon,
		this.disabled = false,
		this.isBusy = false,
		this.fullWidth = false,
		this.iconPosition = UIItemPosition.left,
		this.onTap
	}) : bgColor = UIColorToken.pri100,
			 fgColor = UIColorToken.pri200,
			 contentColor = UIColorToken.pri800,
			 border = BorderSide.none;

	const UIBigButton.outlined({
		super.key,
		required this.label,
		this.assetIcon,
		this.disabled = false,
		this.isBusy = false,
		this.fullWidth = false,
		this.iconPosition = UIItemPosition.left,
		this.onTap
	}) : bgColor = UIColorToken.neu0,
			 fgColor = UIColorToken.neu0,
			 contentColor = UIColorToken.pri800,
			 border = const BorderSide(color: UIColorToken.pri700);

	const UIBigButton.danger({
		super.key,
		required this.label,
		this.assetIcon,
		this.disabled = false,
		this.isBusy = false,
		this.fullWidth = false,
		this.iconPosition = UIItemPosition.left,
		this.onTap
	}) : bgColor = UIColorToken.neg500,
			 fgColor = UIColorToken.neg200,
			 contentColor = UIColorToken.neu0,
			 border = BorderSide.none;

	@override
	Widget build(BuildContext context) {
		return Opacity(
			opacity: disabled ? 0.5 : 1,
		  child: ElevatedButton(
				style: ButtonStyles.buttonStyle(
					fullWidth: fullWidth,
					border: border,
					height: 40,
					bgColor: bgColor,
					fgColor: contentColor.withOpacity(0.1),
					padding: const EdgeInsets.symmetric(horizontal: 15),
					radius: BorderRadius.circular(8),
				),
		  	onPressed: disabled ? null : onTap,
				child: AnimatedCrossFade(
					duration: const Duration(milliseconds: 200),
					crossFadeState: isBusy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
					firstChild: Padding(
						padding: const EdgeInsets.all(2),
					  child: UICircularProgressBar(color: contentColor),
					),
					secondChild: Row(
						mainAxisSize: MainAxisSize.min,
						children: [
							if (assetIcon != null && iconPosition == UIItemPosition.left)
								_buildIcon(),

							Flexible(
								flex: 3,
								child: UIText(
									label,
									overFlow: TextOverflow.ellipsis,
									textAlign: TextAlign.center,
									style: GoogleFonts.kodchasan(),
								),
							),

							if (assetIcon != null && iconPosition == UIItemPosition.right)
								_buildIcon()
						],
					),
		  	),
		  ),
		);
	}

	Widget _buildIcon() {
	  return Flexible(
	    child: Padding(
	    	padding: EdgeInsets.only(
	    		right: iconPosition == UIItemPosition.left ? UIGridToken.kMD : 0,
	    		left: iconPosition == UIItemPosition.right ? UIGridToken.kMD : 0
	    	),
	    	child: UIIcon(
	    		assetIcon!,
	    		color: contentColor,
	    		size: UIGridToken.k2XL,
	    	),
	    ),
	  );
	}
}
