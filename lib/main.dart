import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/movie_event.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_event.dart';
import 'package:flutterr_learn_bloc/ui/home_page.dart';
import 'package:flutterr_learn_bloc/utils/menu_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()..add(GetProductsEvent()),
        ),
        BlocProvider(
          create: (context) => MovieBloc()..add(GetMovieEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter BLOC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MenuBottom(),
      ),
    );
  }
}
