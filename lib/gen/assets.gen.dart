/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/BluePen.png
  AssetGenImage get bluePen => const AssetGenImage('assets/icons/BluePen.png');

  /// File path: assets/icons/BluePodcast.png
  AssetGenImage get bluePodcast =>
      const AssetGenImage('assets/icons/BluePodcast.png');

  /// File path: assets/icons/BottomNavHome.png
  AssetGenImage get bottomNavHome =>
      const AssetGenImage('assets/icons/BottomNavHome.png');

  /// File path: assets/icons/BottomNavUser.png
  AssetGenImage get bottomNavUser =>
      const AssetGenImage('assets/icons/BottomNavUser.png');

  /// File path: assets/icons/BottomNavWrite.png
  AssetGenImage get bottomNavWrite =>
      const AssetGenImage('assets/icons/BottomNavWrite.png');

  /// File path: assets/icons/Hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/icons/Hashtag.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bluePen,
        bluePodcast,
        bottomNavHome,
        bottomNavUser,
        bottomNavWrite,
        hashtag
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Codeyad.png
  AssetGenImage get codeyad => const AssetGenImage('assets/images/Codeyad.png');

  /// File path: assets/images/Geek.png
  AssetGenImage get geek => const AssetGenImage('assets/images/Geek.png');

  /// File path: assets/images/Logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/Logo.png');

  /// File path: assets/images/Meta.png
  AssetGenImage get meta => const AssetGenImage('assets/images/Meta.png');

  /// File path: assets/images/ProfileAvatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/ProfileAvatar.png');

  /// File path: assets/images/Ramzun.png
  AssetGenImage get ramzun => const AssetGenImage('assets/images/Ramzun.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [codeyad, geek, logo, meta, profileAvatar, ramzun, programming];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
