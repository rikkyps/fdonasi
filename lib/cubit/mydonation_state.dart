part of 'mydonation_cubit.dart';

abstract class MydonationState extends Equatable {
  const MydonationState();

  @override
  List<Object> get props => [];
}

class MydonationInitial extends MydonationState {}

class MyDonationLoaded extends MydonationState {
  final List<Payment> donation;

  const MyDonationLoaded(this.donation);

  @override
  List<Object> get props => [donation];
}

class MyDonationUnLoaded extends MydonationState {
  final String message;

  const MyDonationUnLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class LoadMyDonation extends MydonationState {}
