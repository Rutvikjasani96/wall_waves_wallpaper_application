import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

List<String> favoriteGlobal = [];
List<String> favoriteGlobalOrignal = [];

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final favoritesGlobalH = Hive.box('favorites');
  final favoritesGlobalOrignalH = Hive.box('favoritesGlobal');

  FavoriteBloc() : super(FavoriteInitialState()) {
    on<FavoriteInitialEvent>((event, emit) {
      // favoriteGlobal = favoritesGlobalH.get('favorites');
      // favoriteGlobalOrignal = favoritesGlobalOrignalH.get('favoritesGlobal');

      emit(FavoriteInitialState());
    });

    on<FavoriteButtonCLickedEvent>((event, emit) async {
      favoriteGlobal.remove(event.imgUrl);
      favoriteGlobalOrignal.remove(event.imgUrlOrignal);

      await favoritesGlobalH.put('favorites', favoriteGlobal);
      await favoritesGlobalOrignalH.put('favoritesGlobal', favoriteGlobalOrignal);
      emit(FavoriteRemovedActionState());
      emit(FavoriteRemovedState());
    });

    //above
  }
}
