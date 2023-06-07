import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_event.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_state.dart';
import 'package:flutterr_learn_bloc/model/movie_model.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>(
      (event, emit) async {
        emit(MovieLoading());
        try {
          Dio dio = Dio();
          const String url =
              "https://api.themoviedb.org/3/tv/top_rated?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US&page=1";

          var response = await dio.get(url);

          if (response.statusCode == 200) {
            emit(MovieLoaded(movies: MovieModel.fromJson(response.data)));
          } else {
            log("Cannot fetch the data");
          }
        } catch (e) {
          emit(MovieError(error: e.toString()));
        }
      },
    );
  }
}
