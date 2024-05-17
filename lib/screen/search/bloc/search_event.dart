part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

// ignore: must_be_immutable
class SearchButtonClickedEvent extends SearchEvent {
  String query;
  SearchButtonClickedEvent({
    required this.query,
  });
}

class SearcheRefreshCalledEvent extends SearchEvent {}

// ignore: must_be_immutable
class SearchFavoriteButtonClickedEvent extends SearchEvent {
  String imgUrl;
  String imgUrlOrignal;
  SearchFavoriteButtonClickedEvent({
    required this.imgUrl,
    required this.imgUrlOrignal,
  });
}

// ignore: must_be_immutable
class SearchLoadMoreButtonClickedEvent extends SearchEvent {
  String query;
  SearchLoadMoreButtonClickedEvent({
    required this.query,
  });
}
