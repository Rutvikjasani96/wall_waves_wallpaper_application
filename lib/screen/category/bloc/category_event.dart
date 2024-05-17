part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

// ignore: must_be_immutable
class CategoryFetchWallPapers extends CategoryEvent {
  String name;
  CategoryFetchWallPapers({
    required this.name,
  });
}

// ignore: must_be_immutable
class CategoryRefreshEvent extends CategoryEvent {
  String name;
  CategoryRefreshEvent({
    required this.name,
  });
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class CategoryLikedButtonClicked extends CategoryEvent {
  String imgUrl;
  String imgUrlOrignal;
  CategoryLikedButtonClicked({
    required this.imgUrl,
    required this.imgUrlOrignal,
  });
}

// ignore: must_be_immutable
class CategoryLoadMoreButtonClicked extends CategoryEvent {
  String name;
  CategoryLoadMoreButtonClicked({
    required this.name,
  });
}
