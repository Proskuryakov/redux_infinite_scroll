import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_infinite_scroll/config/values.dart';
import 'package:redux_infinite_scroll/pages/photo_card.dart';
import 'package:redux_infinite_scroll/redux/middleware.dart';

import '../redux/state.dart';
import '../resources/text.dart';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({super.key});

  @override
  State<StatefulWidget> createState() => ImagesListState();
}

class ImagesListState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(photoListTitle),
        ),
        body: Center(
            child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              Expanded(
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (_, state) {
                    var store = StoreProvider.of<AppState>(context);
                    if (state.photos.isEmpty) {
                      store.dispatch(loadNextPhotoPages);
                    }
                    return ListView.builder(
                        padding: const EdgeInsets.only(top: 15),
                        scrollDirection: Axis.vertical,
                        itemCount: state.photos.length,
                        itemBuilder: (context, index) {
                          if (index == state.photos.length - pageSize) {
                            store.dispatch(loadNextPhotoPage);
                          }
                          return GestureDetector(
                            child: PhotoCard(state.photos[index], index),
                          );
                        });
                  },
                ),
              )
            ]))));
    //
  }
}
