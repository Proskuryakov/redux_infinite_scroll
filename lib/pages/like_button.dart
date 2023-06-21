import 'package:flutter/material.dart';

import '../models/item/photo.dart';

class PhotoLikeButton extends StatelessWidget {
  final PhotoItem photoItem;

  const PhotoLikeButton({super.key, required this.photoItem});

  @override
  Widget build(BuildContext context) {
    if (photoItem.isLicked) {
      return IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.favorite),
        color: Colors.red,
        onPressed: () {},
      );
    }
    return IconButton(
      splashRadius: 20,
      icon: const Icon(Icons.favorite_border),
      onPressed: () {},
    );
  }
}
