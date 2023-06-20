import 'package:flutter/material.dart';
import 'package:redux_infinite_scroll/models/item/photo.dart';

class PhotoCard extends StatelessWidget {
  final PhotoItem photoItem;

  const PhotoCard({super.key, required this.photoItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
        child: Column(children: [
          // first child
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              photoItem.imageLink!,
              fit: BoxFit.cover,
            ),
          ),
        ]));
  }
}
