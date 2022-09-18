part of 'donation_cubit.dart';

abstract class DonationState extends Equatable {
  const DonationState();

  @override
  List<Object> get props => [];
}

class DonationInitial extends DonationState {}

class DoantionLoaded extends DonationState {
  final List<Donation> donation;

  const DoantionLoaded(this.donation);

  @override
  List<Object> get props => [donation];
}

class DonationUnLoaded extends DonationState {
  final String message;

  const DonationUnLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class LoadDonation extends DonationState {}
