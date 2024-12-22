import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:flutter/material.dart';

import 'hero_dialog_route.dart';

class UIFabMenu extends StatefulWidget {
  /// Used to set the fab Icon.
  final Widget? fabIcon;

  /// Used to set the fab background color.
  final Color? fabBackgroundColor;

  /// Used to set the menu close Icon.
  final Widget? closeMenuButton;

  /// Used to set the fab alignment.
  final Alignment? fabAlignment;

  /// The color of the menu background overlay.
  final Color? overlayColor;

  /// The opacity of the menu background overlay.
  /// Default: 0.8
  final double? overlayOpacity;

  /// Used to set the elevation of the fab button.
  /// Default: 1.0
  final double? elevation;

  /// Children buttons of the menu, from the lowest to the highest.
  final Widget child;

  /// Animated FAB menu button.
  const UIFabMenu({
		super.key,
		this.fabIcon,
		this.fabBackgroundColor,
		this.fabAlignment,
		this.overlayColor,
		this.overlayOpacity,
		this.elevation,
		this.closeMenuButton,
		required this.child
	});

  @override
  _UIFabMenuState createState() => _UIFabMenuState();
}

class _UIFabMenuState extends State<UIFabMenu> {
  @override
  Widget build(BuildContext context) {
		final theme = AppTheme.of(context);
    return Align(
      alignment: widget.fabAlignment ?? Alignment.bottomCenter,
      child: FloatingActionButton.small(
        heroTag: 'main-btn-tag',
        backgroundColor: widget.fabBackgroundColor,
				foregroundColor: widget.fabBackgroundColor?.withOpacity(0.3),
				hoverColor: widget.fabBackgroundColor?.withOpacity(0.3),
				splashColor: Colors.black.withOpacity(0.1),
        elevation: widget.elevation ?? 0,
				shape: RoundedRectangleBorder(
					side: BorderSide(
						width: 1,
						color: theme.colors.txtColor
					),
					borderRadius: BorderRadius.circular(10)
				),
        onPressed: () {
          Navigator.of(context).push(
            HeroDialogRoute(
							fullscreenDialog: true,
              builder: (context) {
                return MainMenu(
                  closeMenuButton: widget.closeMenuButton ??
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                  backgroundColor: widget.overlayColor ?? Colors.black,
                  overlayOpacity: widget.overlayOpacity ?? 0.8,
                  child: widget.child,
                );
              },
            ),
          );
        },
        child: widget.fabIcon ?? const Icon(Icons.more_horiz),
      ),
    );
  }
}

// Full screen main menu
class MainMenu extends StatefulWidget {
  /// Used to set the menu close Icon.
  final Widget closeMenuButton;

  /// Used to get the background color of the menu list.
  final Color backgroundColor;

  /// Used to get the opacity of the background color of the menu list.
  final double overlayOpacity;

  /// Children buttons of the menu, from the lowest to the highest.
  final Widget child;

  const MainMenu({
		super.key,
		required this.backgroundColor,
		required this.overlayOpacity,
		required this.closeMenuButton,
		required this.child
	});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'main-btn-tag',
      child: Material(
        color: widget.backgroundColor.withOpacity(widget.overlayOpacity),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: widget.child,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.transparent,
                        child: widget.closeMenuButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
