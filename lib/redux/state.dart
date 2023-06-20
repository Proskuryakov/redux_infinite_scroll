import '../models/item/photo.dart';

class AppState {
  final List<PhotoItem> _photos;
  final int _page;

  AppState(this._photos, this._page);

  AppState.initialState()
      : _photos = List.empty(),
        _page = 1;

  List<PhotoItem> get photos => _photos;

  int get page => _page;
}
