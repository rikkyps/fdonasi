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

    if (result.value != null) {
      emit(LoginSuccess(result.value));
    } else {
      emit(LoginFailed(result.message!));
    }
  }
}
