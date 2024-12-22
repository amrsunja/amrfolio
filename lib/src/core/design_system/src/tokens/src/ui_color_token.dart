part of app_ui;

class UIColorToken {
	final Color bgColor;
	final Color txtColor;
	final Color cursorColor;
	final Color focusedFieldBorder;
	final Color unfocusedFieldBorder;
	final Color errorFieldBorder;

	const UIColorToken({
		required this.bgColor,
		required this.txtColor,
		required this.cursorColor,
		this.focusedFieldBorder = pri700,
		this.unfocusedFieldBorder = pri300,
		this.errorFieldBorder = neg500,
	});
	
	factory UIColorToken.light() => const UIColorToken(
		bgColor: neu200,
		cursorColor: pri800,
		txtColor: neu900,
	);

	factory UIColorToken.dark() => const UIColorToken(
		bgColor: neu900,
		cursorColor: pri300,
		txtColor: pri0,
	);

	// Primary
	static const Color pri0			= Color(0xffF8FAFA);
	static const Color pri100		= Color(0xffEFF4F5);
	static const Color pri200		= Color(0xffE3EFF1);
	static const Color pri300		= Color(0xffCFE3E7);
	static const Color pri400		= Color(0xff9BB4B9);
	static const Color pri500		= Color(0xff3C9EB4);
	static const Color pri600		= Color(0xff2F7F91);
	static const Color pri700		= Color(0xff567F88);
	static const Color pri800		= Color(0xff054857);
	static const Color pri900		= Color(0xff043844);

	// Neutral
	static const Color neu0			= Color(0xffFFFFFF);
	static const Color neu100		= Color(0xffFAFAFA);
	static const Color neu200		= Color(0xffF4F4F4);
	static const Color neu300		= Color(0xffE6E6E6);
	static const Color neu400		= Color(0xffB3B3B3);
	static const Color neu500		= Color(0xff848383);
	static const Color neu900		= Color(0xff02191E);

	// Positive
	static const Color pos200		= Color(0xffEDFDF3);
	static const Color pos500		= Color(0xff2C9E5C);

	// Negative
	static const Color neg200		= Color(0xffFDEDEF);
	static const Color neg500		= Color(0xffC03649);

	// Shadow
	static const Color shadow1	= Color(0xffD9D9D9);

	// Other
	static final Color overlay	= pri700.withOpacity(0.4);
}
