part of app_ui;

class AppThemeData {
	AppThemeData({
		required this.borders,
		required this.colors,
		required this.keyboardTheme,
	});

	factory AppThemeData.light() => AppThemeData(
		borders: UIBorderToken.light(),
		colors: UIColorToken.light(),
		keyboardTheme: Brightness.light,
	);

	factory AppThemeData.dark() => AppThemeData(
		borders: UIBorderToken.dark(),
		colors: UIColorToken.dark(),
		keyboardTheme: Brightness.dark,
	);

	final UIBorderToken borders;
	final UIColorToken colors;
	final Brightness? keyboardTheme;
}
