// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';
import '../services/services.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> payment(String slug, String amount, String doa) async {
    int fixAmount = int.parse(amount);
    ApiReturnValue result =
        await DonationServices.payment(fixAmount, doa, slug);

    emit(OnPayment());

    await Future.delayed(const Duration(seconds: 3));

    if (result.value != null) {
      emit(SuccessPayment(result.value));
    } else {
      emit(FailedPayment(result.message!));
    }
  }

  Future<void> checkPayment() async {
    emit(DonePayment());
  }
}
