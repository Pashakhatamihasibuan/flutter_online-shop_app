part of 'all_product_bloc.dart';

@freezed
class AllProductState with _$AllProductState {
  const factory AllProductState.initial() = Initial;
  const factory AllProductState.loading() = Loading;
  const factory AllProductState.loaded(List<Product> products) = Loaded;
  const factory AllProductState.error(String message) = Error;
}
