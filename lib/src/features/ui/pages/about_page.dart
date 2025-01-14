import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:amrfolio/src/core/locale/l10n.dart';
import 'package:amrfolio/src/core/utils/assets.dart';
import 'package:amrfolio/src/core/utils/extentions.dart';
import 'package:amrfolio/src/features/ui/widgets/skill_item_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parallax_effect/parallax_effect.dart';


@RoutePage()
class AboutPage extends StatelessWidget {
	const AboutPage({super.key});

	@override
	Widget build(BuildContext context) {
		final locale = AppLocale.of(context)!;
		final screen = MediaQuery.of(context).size;
		final theme = AppTheme.of(context);
		final languages= ['Dart', 'Python', 'Golang', 'CPP', 'JS', 'HTML', 'CSS'];
		final frameworks = ['Flutter', 'Django', 'Docker', 'Firebase', 'PostgresQL', 'Nginx', 'Bash', 'Node JS', 'Gunicorn'];
		final programs = ['GitHub', 'GitLab', 'Postman', 'Vim', 'Slack', 'Jira', 'Notion'];
		final design = ['Figma', 'Lightroom', 'Photoshop', 'XD'];

		return Material(
			color: theme.colors.bgColor,
		  child: UIResponsiveBuilder(
		    builder: (context, constraints, type) {
		      return ConstrainedBox(
		      	constraints: BoxConstraints(
		      		minHeight: screen.height
		      	),
		        child: UIDynamicColumnRow(
		        	displayLikeRow: type == UIDeviceScreenType.web,
		  				children: [
		  					Container(
		  						color: UIColorToken.neu200,
		  						width: screen.width * (type == UIDeviceScreenType.web ? .55 : 1),
		  						child: Column(
		  						  children: [
		  								Column(
		  									crossAxisAlignment: CrossAxisAlignment.start,
		  									children: [
		  										SizedBox(height: 100),
		  										UIDynamicColumnRow(
		  											textDirection: TextDirection.rtl,
		  											displayLikeRow: true,
		  										  children: [
															UIImage.asset(
																height: screen.width * (type == UIDeviceScreenType.web ? .2 : .5),
																boxFit: BoxFit.contain,
																image: Assets.drawnAvatar
															),
															Container(
																padding: EdgeInsets.all(20),
																color: UIColorToken.neu900,
															  child: UIText(
															  	locale.about_page_title.toUpperCase(),
															  	textAlign: TextAlign.right,
															  	style: GoogleFonts.vastShadow(
															  		fontSize: screen.width * (type == UIDeviceScreenType.web ? .04 : .06),
															  		color: UIColorToken.neu0,
															  	),
															  ),
															)
		  										  ],
		  										),
		  									],
											).animate(
													effects: [FadeEffect(duration: 2.seconds)],
													delay: .2.seconds
											).slide(curve: Curves.fastEaseInToSlowEaseOut),

											SizedBox(height: 50),

		  						    Padding(
		  						    	padding: const EdgeInsets.only(right: 60.0),
		  						      child: Container(
													padding: EdgeInsets.symmetric(
														horizontal: 20,
														vertical: 150,
													),
		  						      	color: UIColorToken.neu900,
													child: Column(
														mainAxisAlignment: MainAxisAlignment.end,
														children: [
															UIText(
																locale.about_page_tools_title.toUpperCase(),
																style: GoogleFonts.kodchasan(
																	fontSize: screen.width * (type == UIDeviceScreenType.web ? .02 : .04),
																	color: UIColorToken.neu0,
																),
															).animate(
																effects: [FadeEffect(duration: .2.seconds)],
																delay: .3.seconds,
															),
															SizedBox(height: 100),
															SizedBox(
																width: double.infinity,
																child: Wrap(
																	alignment: WrapAlignment.center,
																	spacing: 80,
																	runSpacing: 80,
																	children: [
																		SkillsColumn(languages: languages),
																		SkillsColumn(languages: frameworks),
																		SkillsColumn(languages: programs),
																		SkillsColumn(languages: design),
																	],
																),
															),
														],
													)
		  						      ),
		  						    ),
		  						  ],
		  						),
		  					),
		  					Container(
		  						color: UIColorToken.neu200,
		  						constraints: BoxConstraints(
		  							minHeight: screen.height,
		  						),
		  						width: screen.width * (type == UIDeviceScreenType.web ? .45 : .7),
		  						child: Padding(
		          			padding: EdgeInsets.symmetric(horizontal: screen.width * (type == UIDeviceScreenType.web ? .04 : 0)),
		  							child: Column(
		  								mainAxisAlignment: MainAxisAlignment.center,
		  							  children: [
												SizedBox(height: 50),
		  							    UIText(
		  							    	locale.about_page_bio,
		  										color: UIColorToken.neu900,
		  							    	textAlign: TextAlign.start,
		  							    	style: GoogleFonts.kodchasan(
		  							    		fontSize: 18
		  							    	),
		  									).animate(
		                  			effects: [FadeEffect(duration: 1.seconds)],
		                  			delay: .7.seconds,
		  									),
		  									SizedBox(height: 200),
		  									UIImage.asset(
		  										height: type == UIDeviceScreenType.web ? screen.width / 5 : double.infinity,
		  										boxFit: BoxFit.contain,
		  										image: Assets.drop
		  									).animate(
		  									).scale(
		  										duration: 1.seconds,
		  										curve: Curves.fastOutSlowIn
		  									),
		  							  ],
		  							)
		  						),
		  					),
		  				],
		        ),
		      );
		    }
		  ),
		);
	}
}

class SkillsColumn extends StatelessWidget {
  const SkillsColumn({
    super.key,
    required this.languages,
  });

  final List<String> languages;

  @override
  Widget build(BuildContext context) {
    return Column(
    	spacing: 15,
    	crossAxisAlignment: CrossAxisAlignment.start,
    	children: languages.map((item) => SkillItemWidget(
    		title: item,
    		icon: 'assets/icons/$item.svg'
    	)).toList(),
    );
  }
}
