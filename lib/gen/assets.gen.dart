// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsDrawablesGen {
  const $AssetsDrawablesGen();

  /// File path: assets/drawables/ic_arrow.svg
  SvgGenImage get icArrow => const SvgGenImage('assets/drawables/ic_arrow.svg');

  /// File path: assets/drawables/ic_arrow_right.svg
  SvgGenImage get icArrowRight =>
      const SvgGenImage('assets/drawables/ic_arrow_right.svg');

  /// File path: assets/drawables/ic_hide_pwd.svg
  SvgGenImage get icHidePwd =>
      const SvgGenImage('assets/drawables/ic_hide_pwd.svg');

  /// File path: assets/drawables/ic_show_pwd.svg
  SvgGenImage get icShowPwd =>
      const SvgGenImage('assets/drawables/ic_show_pwd.svg');

  /// File path: assets/drawables/img_no_connection.svg
  SvgGenImage get imgNoConnection =>
      const SvgGenImage('assets/drawables/img_no_connection.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icArrow,
    icArrowRight,
    icHidePwd,
    icShowPwd,
    imgNoConnection,
  ];
}

class $AssetsLanguagesGen {
  const $AssetsLanguagesGen();

  /// File path: assets/languages/en.json
  String get en => 'assets/languages/en.json';

  /// List of all assets
  List<String> get values => [en];
}

abstract final class Assets {
  static const $AssetsDrawablesGen drawables = $AssetsDrawablesGen();
  static const $AssetsLanguagesGen languages = $AssetsLanguagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
