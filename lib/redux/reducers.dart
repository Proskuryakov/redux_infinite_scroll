import 'package:redux_infinite_scroll/redux/actions.dart';

import 'state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoadPhotosAction) {
    return loadPhotos(action);
  }

  return state;
}

AppState loadPhotos(LoadPhotosAction action) {
  return AppState(action.photos, action.page);
}
