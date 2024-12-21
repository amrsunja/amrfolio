part of app_ui;

class UIIconToken {
	static const String adobeL = 'assets/icons/adobe_lightroom.svg';
	static const String adobeP = 'assets/icons/adobe_photoshop.svg';
	static const String adobeXd = 'assets/icons/adobe_xd.svg';
	static const String bash = 'assets/icons/bash.svg';
	static const String cpp = 'assets/icons/cpp.svg';
	static const String css = 'assets/icons/css.svg';
	static const String dart = 'assets/icons/dart.svg';
	static const String django = 'assets/icons/django.svg';
	static const String docker = 'assets/icons/docker.svg';
	static const String figma = 'assets/icons/figma.svg';
	static const String firebase = 'assets/icons/firebase.svg';
	static const String flutter = 'assets/icons/flutter.svg';
	static const String github = 'assets/icons/github.svg';
	static const String gitlab = 'assets/icons/gitlab.svg';
	static const String go = 'assets/icons/go.svg';
	static const String gunicorn = 'assets/icons/gunicorn.svg';
	static const String html = 'assets/icons/html.svg';
	static const String jira = 'assets/icons/jira.svg';
	static const String js = 'assets/icons/js.svg';
	static const String nginx = 'assets/icons/nginx.svg';
	static const String node = 'assets/icons/node.svg';
	static const String notion = 'assets/icons/notion.svg';
	static const String postgresql = 'assets/icons/postgresql.svg';
	static const String postman = 'assets/icons/postman.svg';
	static const String python = 'assets/icons/python.svg';
	static const String slack = 'assets/icons/slack.svg';
	static const String vim = 'assets/icons/vim.svg';

	static Widget toIcon(
		/// icon - is the path to the asset icon
		String icon, {
		Color? color,
		double? size,
		Alignment? alignment,
		}) {
	  return SvgPicture.asset(
			icon,
			width: size,
			height: size,
			colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
			fit: BoxFit.contain,
			alignment: alignment ?? Alignment.center,
		);
	}
}
