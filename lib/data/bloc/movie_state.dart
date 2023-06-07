import '../../model/movie_model.dart';

class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieModel movies;

  MovieLoaded({required this.movies});
}

class MovieError extends MovieState {
  final String error;

  MovieError({required this.error});
}
