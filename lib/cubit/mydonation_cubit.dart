import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'mydonation_state.dart';

class MydonationCubit extends Cubit<MydonationState> {
  MydonationCubit() : super(MydonationInitial());

  Future<void> getMyDonation() async {
    ApiReturnValue result = await DonationServices.getMyDonation();

    emit((LoadMyDonation()));

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(MyDonationLoaded(result.value));
    } else {
      emit(MyDonationUnLoaded(result.message!));
    }
  }
}
