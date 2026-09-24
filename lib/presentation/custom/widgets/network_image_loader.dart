import 'package:base_project/util/core_export.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Cached network image with grey placeholder and rounded corners.
class NetworkImageLoader extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadiusGeometry borderRadius;

  const NetworkImageLoader({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius = BorderRadius.zero,
  });

  static Future<bool> clearImageCache(String imageUrl) => CachedNetworkImage.evictFromCache(imageUrl);

  Widget get _defaultPlaceholder => Container(height: height, width: width, color: ColorName.neutral95);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: url.isEmpty
          ? (errorWidget ?? _defaultPlaceholder)
          : CachedNetworkImage(
              imageUrl: url,
              height: height,
              width: width,
              fit: fit,
              placeholder: (_, _) => placeholder ?? _defaultPlaceholder,
              errorWidget: (_, _, _) => errorWidget ?? _defaultPlaceholder,
            ),
    );
  }
}
