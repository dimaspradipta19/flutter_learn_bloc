import '../../model/product_model.dart';

class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ListModel>? products;

  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String error;

  ProductsError({required this.error});
}
