import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:redux_infinite_scroll/pages/like_button.dart';

import '../models/item/photo.dart';

class PhotoFullSizePage extends StatelessWidget {
  final PhotoItem photoItem;
  final int photoIndex;

  const PhotoFullSizePage(this.photoItem, this.photoIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      dismissThresholds: const {DismissDirection.up: 0.7},
      dragStartBehavior: DragStartBehavior.start,
      background: const ColoredBox(color: Colors.black),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: Text(photoItem.title!),
          ),
          floatingActionButton: _buildActionButton(),
          body: Center(
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained,
              imageProvider: CachedNetworkImageProvider(photoItem.imageLink!),
            ),
          )),
    );
    //
  }

  Widget? _buildActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: PhotoLikeButton(photoItem, photoIndex),
    );
  }
}
