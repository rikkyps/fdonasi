// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fdonasi/models/models.dart';
import 'package:fdonasi/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String email, String password) async {
    ApiReturnValue result = await UserServices.login(email, password);

    emit(OnLogin());
    await Future.delayed(const Duration(seconds: 2));

    if (result.value != null) {
      emit(LoginSuccess(result.value));
    } else {
      emit(LoginFailed(result.message!));
    }
  }

  Future<void> register(String name, String email, String password,
      String passwordConfirmation) async {
    ApiReturnValue result = await UserServices.register(
        email, password, passwordConfirmation, name);

    emit(OnRegister());
    await Future.delayed(const Duration(seconds: 2));

    if (result.value != null) {
      emit(SuccessRegister(result.value));
    } else {
      emit(FailedRegister(result.message!));
    }
  }

  Future<void> checkSession() async {
    ApiReturnValue result = await UserServices.checkSession();

    emit(OnCheckSession());
    await Future.delayed(const Duration(seconds: 2));

    if (result.value != null) {
      emit(SessionLoaded(result.value));
    } else {
      emit(SessionUnLoaded(result.message!));
    }
  }

  Future<void> logout() async {
    UserServices.removeToken();
    emit(Logout());
  }
}
