part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;

  const CategoryLoaded(this.category);

  @override
  List<Object> get props => [category];
}

class CategoryUnLoaded extends CategoryState {
  final String message;

  const CategoryUnLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class LoadCategory extends CategoryState {}
