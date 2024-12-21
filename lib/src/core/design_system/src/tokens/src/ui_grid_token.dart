part of app_ui;

class UIGridToken {
	/// 1 rem is 8 pixels
	static const double _rem = 8;
	static double remToPx(double rem) => _rem * rem;

	/// 0.125
	static final double k2XS = remToPx(0.125);
	/// 0.25
	static final double kXS = remToPx(0.25);
	/// 0.5
	static final double kSM = remToPx(0.5);
	/// 1
	static final double kMD = remToPx(1);
	/// 1.5
	static final double kLG = remToPx(1.5);
	/// 2
	static final double kXL = remToPx(2);
	/// 3
	static final double k2XL = remToPx(3);
	/// 4 
	static final double k3XL = remToPx(4);
	/// 5
	static final double k4XL = remToPx(5);
	/// 6
	static final double k5XL = remToPx(6);
	/// 7
	static final double k6XL = remToPx(7);
	/// 8
	static final double k7XL = remToPx(8);
}
