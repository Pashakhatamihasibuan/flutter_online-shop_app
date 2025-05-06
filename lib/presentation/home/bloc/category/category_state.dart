part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.loaded(List<Category> categories) =
      CategoryLoaded;
  const factory CategoryState.error(String message) = CategoryError;
}
