part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = Started;
  const factory ProductEvent.getProductByCategory(int categoryId) =
      GetProductByCategory;
}
