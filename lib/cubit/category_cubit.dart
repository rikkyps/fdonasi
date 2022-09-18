// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategory() async {
    ApiReturnValue result = await DonationServices.getCategory();

    emit(LoadCategory());

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(CategoryLoaded(result.value));
    } else {
      emit(CategoryUnLoaded(result.message!));
    }
  }
}
