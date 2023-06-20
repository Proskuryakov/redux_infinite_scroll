import '../models/item/photo.dart';

class LoadPhotosAction {
  final List<PhotoItem> _photos;
  final int _page;

  LoadPhotosAction(this._photos, this._page);

  int get page => _page;

  List<PhotoItem> get photos => _photos;
}
