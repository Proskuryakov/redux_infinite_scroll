import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:redux_infinite_scroll/pages/like_button.dart';

import '../models/item/photo.dart';

class PhotoFullSizePage extends StatelessWidget {
  final PhotoItem photoItem;

  const PhotoFullSizePage(this.photoItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(photoItem.title!),
          actions: [PhotoLikeButton(photoItem: photoItem)],
        ),
        body: Center(
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained,
            imageProvider: CachedNetworkImageProvider(photoItem.imageLink!),
          ),
        ));
    //
  }
}
