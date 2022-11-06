import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const double _borderRadius = 12;
const String _tmdbImgHostUrl = 'https://image.tmdb.org/t/p/w500';

class PosterCard extends StatelessWidget {
  const PosterCard({
    required this.name,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final String? image = imageUrl;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          if (image != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadius),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: '$_tmdbImgHostUrl$image',
                  ),
                ),
              ),
            ),
          Center(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
