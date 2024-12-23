
// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:typed_data';
import 'package:amrfolio/src/core/design_system/app_ui.dart';
import 'package:flutter/material.dart';

class UIImage extends StatelessWidget {
	/// [imageUrl] Network or local path to the image
	final String? image;
	final Uint8List? memoryImage;
	final BoxFit boxFit;
	final bool zoomEnabled;
	final Widget? defaultImage;
	final UIDataSourceFrom source;
	final double height;
	final double maxHeight;

	const UIImage.network({
		super.key,
		this.image,
		this.memoryImage,
		this.zoomEnabled = false,
		this.defaultImage,
		this.boxFit = BoxFit.cover,
		this.height = double.infinity,
		this.maxHeight = double.infinity,
	}) : source = UIDataSourceFrom.network;

	const UIImage.asset({
		super.key,
		this.image,
		this.memoryImage,
		this.zoomEnabled = false,
		this.defaultImage,
		this.boxFit = BoxFit.cover,
		this.height = double.infinity,
		this.maxHeight = double.infinity,
	}) : source = UIDataSourceFrom.assets;

	const UIImage.memory({
		super.key,
		this.image,
		this.memoryImage,
		this.zoomEnabled = false,
		this.defaultImage,
		this.boxFit = BoxFit.cover,
		this.height = double.infinity,
		this.maxHeight = double.infinity,
	}) : source = UIDataSourceFrom.memory;

	@override
	Widget build(BuildContext context) {
		if ((image == null || image == '') && memoryImage == null)
			return _errorBuilder();

		return ConstrainedBox(
			constraints: BoxConstraints(
				maxHeight: height > maxHeight ? maxHeight : height,
			),
			child: _imageBuilder()
		);
	}

	Widget _errorBuilder() {
		return defaultImage ?? Center(
			child: Icon(
				Icons.browse_gallery_rounded,
				size: UIGridToken.k3XL
			)
		);
	}

	Widget _imageBuilder() {
		switch (source) {
			case UIDataSourceFrom.network:
				return Image.network(
					image!,
					errorBuilder: (context, obj, _) {
						return _errorBuilder();
					},
				);
			case UIDataSourceFrom.assets:
				return Image.asset(
					image!,
					fit: boxFit,
					errorBuilder: (context, obj, stackTrace) => _errorBuilder(),
				);
			case UIDataSourceFrom.memory:
				return Image.memory(
					memoryImage!,
					fit: boxFit,
					errorBuilder: (context, obj, stackTrace) => _errorBuilder(),
				);
		}
	}
}
