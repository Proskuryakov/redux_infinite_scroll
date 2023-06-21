import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redux_infinite_scroll/models/item/photo.dart';

class PhotoCard extends StatelessWidget {
  final PhotoItem photoItem;

  const PhotoCard({super.key, required this.photoItem});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 1)),
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: photoItem.imageLink!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            photoItem.title!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Spacer(),
                          IconButton(
                            splashRadius: 20,
                            icon: const Icon(
                                Icons.favorite_border
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
