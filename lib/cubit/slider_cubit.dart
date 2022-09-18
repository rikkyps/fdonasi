// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  Future<void> getSlider() async {
    ApiReturnValue result = await DonationServices.getSlider();

    emit(LoadSlider());

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(SliderLoaded(result.value));
    } else {
      emit(SliderUnLoaded(result.message!));
    }
  }
}
