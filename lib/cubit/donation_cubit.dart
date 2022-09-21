// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fdonasi/models/models.dart';
import 'package:fdonasi/services/services.dart';

part 'donation_state.dart';

class DonationCubit extends Cubit<DonationState> {
  DonationCubit() : super(DonationInitial());

  Future<void> getCampaign({String? keyword}) async {
    ApiReturnValue result;

    emit(LoadDonation());
    await Future.delayed(const Duration(seconds: 3));
    if (keyword == null) {
      result = await DonationServices.getCampaign();
      if (result.value != null) {
        emit(DoantionLoaded(result.value));
      } else {
        emit(DonationUnLoaded(result.message!));
      }
    } else {
      result = await DonationServices.searchDonation(keyword);
      if (result.value != null) {
        emit(SearchLoaded(result.value));
      } else {
        emit(SearchNotFound(result.message!));
      }
    }
  }

  Future<void> searchCampaign(String? keyword) async {
    ApiReturnValue result = await DonationServices.searchDonation(keyword);

    emit(OnSearch());

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(SearchLoaded(result.value));
    } else {}
  }
}
