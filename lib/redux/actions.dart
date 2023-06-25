import '../models/item/photo.dart';

class LoadPhotosAction {
  final List<PhotoItem> _photos;
  final int _page;

  LoadPhotosAction(this._photos, this._page);

  int get page => _page;

  List<PhotoItem> get photos => _photos;
}

class LikeAction {
  final PhotoItem _photo;
  final int _index;

  LikeAction(this._photo, this._index);

  int get index => _index;

  PhotoItem get photo => _photo;
}

class OpenPhotoAction {
  final int _index;

  OpenPhotoAction(this._index);

  int get index => _index;
}
