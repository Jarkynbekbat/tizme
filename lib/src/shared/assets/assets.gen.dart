/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAboutGen {
  const $AssetsAboutGen();

  /// File path: assets/about/about_us.svg
  SvgGenImage get aboutUs => const SvgGenImage('assets/about/about_us.svg');

  /// File path: assets/about/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/about/ic_launcher.png');

  /// List of all assets
  List<dynamic> get values => [aboutUs, icLauncher];
}

class $AssetsIntroGen {
  const $AssetsIntroGen();

  /// File path: assets/intro/intro_0.svg
  SvgGenImage get intro0 => const SvgGenImage('assets/intro/intro_0.svg');

  /// File path: assets/intro/intro_1.svg
  SvgGenImage get intro1 => const SvgGenImage('assets/intro/intro_1.svg');

  /// File path: assets/intro/intro_2.svg
  SvgGenImage get intro2 => const SvgGenImage('assets/intro/intro_2.svg');

  /// List of all assets
  List<SvgGenImage> get values => [intro0, intro1, intro2];
}

class $AssetsSetupGen {
  const $AssetsSetupGen();

  /// File path: assets/setup/setup.svg
  SvgGenImage get setup => const SvgGenImage('assets/setup/setup.svg');

  /// List of all assets
  List<SvgGenImage> get values => [setup];
}

class $AssetsSharedGen {
  const $AssetsSharedGen();

  /// File path: assets/shared/no_data.svg
  SvgGenImage get noData => const SvgGenImage('assets/shared/no_data.svg');

  /// List of all assets
  List<SvgGenImage> get values => [noData];
}

class Assets {
  Assets._();

  static const $AssetsAboutGen about = $AssetsAboutGen();
  static const $AssetsIntroGen intro = $AssetsIntroGen();
  static const $AssetsSetupGen setup = $AssetsSetupGen();
  static const $AssetsSharedGen shared = $AssetsSharedGen();
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
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
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      color: color,
      colorBlendMode: colorBlendMode,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
