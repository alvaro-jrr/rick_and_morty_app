import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterAvatar extends StatelessWidget {
  /// The character [image].
  final String image;

  /// The avatar [size].
  final double? size;

  const CharacterAvatar({super.key, required this.image, this.size});

  @override
  Widget build(BuildContext context) {
    final radius = size != null ? size! / 2 : null;

    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) {
        return CircleAvatar(radius: radius);
      },
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(backgroundImage: imageProvider, radius: radius);
      },
    );
  }
}
