/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/app_icon.svg
  SvgGenImage get appIcon => const SvgGenImage('assets/image/app_icon.svg');

  /// File path: assets/image/dollar.svg
  SvgGenImage get dollar => const SvgGenImage('assets/image/dollar.svg');

  /// File path: assets/image/ic_add_note.svg
  SvgGenImage get icAddNote =>
      const SvgGenImage('assets/image/ic_add_note.svg');

  /// File path: assets/image/ic_add_sub_task.svg
  SvgGenImage get icAddSubTask =>
      const SvgGenImage('assets/image/ic_add_sub_task.svg');

  /// File path: assets/image/ic_category_private.svg
  SvgGenImage get icCategoryPrivate =>
      const SvgGenImage('assets/image/ic_category_private.svg');

  /// File path: assets/image/ic_delete.svg
  SvgGenImage get icDelete => const SvgGenImage('assets/image/ic_delete.svg');

  /// File path: assets/image/ic_dropdown.svg
  SvgGenImage get icDropdown =>
      const SvgGenImage('assets/image/ic_dropdown.svg');

  /// File path: assets/image/ic_edit_note.svg
  SvgGenImage get icEditNote =>
      const SvgGenImage('assets/image/ic_edit_note.svg');

  /// File path: assets/image/ic_navigation_back.svg
  SvgGenImage get icNavigationBack =>
      const SvgGenImage('assets/image/ic_navigation_back.svg');

  /// File path: assets/image/ic_save_note.svg
  SvgGenImage get icSaveNote =>
      const SvgGenImage('assets/image/ic_save_note.svg');

  /// File path: assets/image/trash.svg
  SvgGenImage get trash => const SvgGenImage('assets/image/trash.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appIcon,
        dollar,
        icAddNote,
        icAddSubTask,
        icCategoryPrivate,
        icDelete,
        icDropdown,
        icEditNote,
        icNavigationBack,
        icSaveNote,
        trash
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
