part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

abstract class FavoriteActionState extends FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteRemovedState extends FavoriteState {}

class FavoriteRemovedActionState extends FavoriteActionState {}
