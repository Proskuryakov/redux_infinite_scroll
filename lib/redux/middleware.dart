import 'package:redux/redux.dart';
import 'package:redux_infinite_scroll/models/item/photo.dart';
import 'package:redux_infinite_scroll/redux/actions.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data/repository.dart';
import '../models/dto/photo.dart';
import 'state.dart';

final Repository repository = Repository.getInstance();

ThunkAction<AppState> loadNextPhotoPage = (Store<AppState> store) async {
  PhotoPage photoPage = await repository.nextPage(store.state.page);

  List<PhotoItem> result = [];
  result.addAll(store.state.photos);
  for (var p in photoPage.photo!) {
    result.add(PhotoItem.fromPhoto(p));
  }

  store.dispatch(LoadPhotosAction(result, store.state.page + 1));
};

ThunkAction<AppState> loadNextPhotoPages = (Store<AppState> store) async {
  int pageCount = 3;
  PhotoPage photoPage =
      await repository.getPageByCount(store.state.page, pageCount);

  List<PhotoItem> result = [];
  result.addAll(store.state.photos);
  for (var p in photoPage.photo!) {
    result.add(PhotoItem.fromPhoto(p));
  }

  store.dispatch(LoadPhotosAction(result, store.state.page + pageCount));
};
