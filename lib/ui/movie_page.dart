import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_state.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Bloc from object"),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const CircularProgressIndicator.adaptive();
          }

          if (state is MovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.results.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.movies.results[index].name),
                  subtitle: Text(state.movies.results[index].overview),
                );
              },
            );
          }

          return const Center(
            child: Text("No Data"),
          );
        },
      ),
    );
  }
}
