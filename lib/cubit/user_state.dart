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

class OnLogin extends UserState {}

class Logout extends UserState {}

class OnRegister extends UserState {}

class OnCheckSession extends UserState {}

class SessionLoaded extends UserState {
  final User user;

  const SessionLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class SessionUnLoaded extends UserState {
  final String message;

  const SessionUnLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessRegister extends UserState {
  final User user;

  const SuccessRegister(this.user);
  @override
  List<Object> get props => [user];
}

class FailedRegister extends UserState {
  final String message;

  const FailedRegister(this.message);

  @override
  List<Object> get props => [message];
}
