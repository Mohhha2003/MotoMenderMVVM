part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError({required this.message});
}

final class FavoritesEmpty extends FavoritesState {}
final class FavoritesPopulated extends FavoritesState {}


final class FavoriteAdded extends FavoritesState {}

final class FavoriteDeleted extends FavoritesState {
  final String message;

  FavoriteDeleted({required this.message});
}

final class FavortiesLoading extends FavoritesState {}
