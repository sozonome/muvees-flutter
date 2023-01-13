import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 24;
const String _tmdbImgHostUrl = 'https://image.tmdb.org/t/p/w500';

class PosterImage extends StatelessWidget {
  const PosterImage({
    required this.imagePath,
    this.intrinsicWidth = 500,
    this.isRounded = true,
    Key? key,
  }) : super(key: key);

  final String imagePath;

  /// instrinsic image width
  final int intrinsicWidth;
  final bool isRounded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isRounded ? _borderRadius : 0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: CachedNetworkImage(
          imageUrl: '$_tmdbImgHostUrl$imagePath',
        ),
      ),
    );
  }
}
