import 'package:redux_infinite_scroll/redux/actions.dart';

import '../models/item/photo.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoadPhotosAction) {
    return _loadPhotos(action);
  }
  if (action is LikeAction) {
    return _likeImage(state, action);
  }

  return state;
}

AppState _loadPhotos(LoadPhotosAction action) {
  return AppState(action.photos, action.page);
}

AppState _likeImage(AppState state, LikeAction action) {
  List<PhotoItem> result = List.from(state.photos);
  PhotoItem photo = PhotoItem(
      action.photo.title, action.photo.imageLink, !action.photo.isLicked);
  result[action.index] = photo;
  return AppState(result, state.page);
}
