part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoginSuccess extends UserState {
  final User user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginFailed extends UserState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}
