import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_event.dart';
import 'package:flutterr_learn_bloc/data/bloc/products_state.dart';
import '../../model/product_model.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProductsLoading());

      try {
        final Dio dio = Dio();
        const String url =
            "https://api.escuelajs.co/api/v1/products?offset=10&limit=10";

        var response = await dio.get(url);

        if (response.statusCode == 200) {
          List<dynamic> resultData = response.data;

          List<ListModel>? result =
              resultData.map((e) => ListModel.fromJson(e)).toList();

          emit(ProductsLoaded(products: result));
        } else {
          log("Failed to fetch data");
        }
      } catch (e) {
        emit(ProductsError(error: e.toString()));
      }
    });
  }
}
