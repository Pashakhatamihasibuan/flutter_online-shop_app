import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;

  LoginBloc(this.authRemoteDatasource) : super(const LoginState.initial()) {
    on<Login>((event, emit) async {
      emit(const LoginState.loading());

      final response =
          await authRemoteDatasource.login(event.email, event.password);

      response.fold(
        (l) => emit(LoginState.error(l)),
        (r) => emit(LoginState.loaded(r)),
      );
    });
  }
}
