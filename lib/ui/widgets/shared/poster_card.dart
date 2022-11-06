import 'package:flutter/material.dart';
import 'package:muvees/ui/widgets/shared/poster_image.dart';

const double _borderRadius = 12;

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
              child: PosterImage(imagePath: image),
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
