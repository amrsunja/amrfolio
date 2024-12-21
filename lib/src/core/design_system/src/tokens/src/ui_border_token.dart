part of app_ui;

class UIBorderToken {
	const UIBorderToken();
	
	factory UIBorderToken.light() => const UIBorderToken();
	factory UIBorderToken.dark() => const UIBorderToken();

	OutlineInputBorder get textFieldUnfocusedBorder => _buildBorder(UIColorToken.pri300);
	OutlineInputBorder get textFieldFocusedBorder => _buildBorder(UIColorToken.pri400);
	OutlineInputBorder get textFieldErrorBorder => _buildBorder(UIColorToken.neg200);
	
	OutlineInputBorder _buildBorder(Color color) => OutlineInputBorder(
		borderRadius: BorderRadius.circular(8),
		borderSide: BorderSide(color: color)
	);
}
