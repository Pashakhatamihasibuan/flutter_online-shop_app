part of 'all_product_bloc.dart';

@freezed
class AllProductEvent with _$AllProductEvent {
  const factory AllProductEvent.started() = Started;
  const factory AllProductEvent.getAllProducts() = GetAllProducts;
}
