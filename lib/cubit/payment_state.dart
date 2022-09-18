part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class SuccessPayment extends PaymentState {
  final String link;

  const SuccessPayment(this.link);
  @override
  List<Object> get props => [link];
}

class FailedPayment extends PaymentState {
  final String message;

  const FailedPayment(this.message);
  @override
  List<Object> get props => [message];
}

class OnPayment extends PaymentState {}

class DonePayment extends PaymentState {}

