import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter bloc"),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const CircularProgressIndicator.adaptive();
            }

            if (state is ProductsLoaded) {
              return ListView.builder(
                itemCount: state.products!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.products![index].title),
                    subtitle: Text(state.products![index].description),
                  );
                },
              );
            }

            return const Center(
              child: Text("No Data"),
            );
          },
        ));
  }
}
