// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fdonasi/models/models.dart';
import 'package:fdonasi/services/services.dart';

part 'donation_state.dart';

class DonationCubit extends Cubit<DonationState> {
  DonationCubit() : super(DonationInitial());

  Future<void> getCampaign() async {
    ApiReturnValue result = await DonationServices.getCampaign();

    emit(LoadDonation());

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(DoantionLoaded(result.value));
    } else {
      emit(DonationUnLoaded(result.message!));
    }
  }
}
