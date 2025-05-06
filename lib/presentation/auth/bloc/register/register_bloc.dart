import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/register_remote_datasource.dart';
import '../../../../data/models/responses/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRemoteDatasource remoteDatasource;

  RegisterBloc(this.remoteDatasource) : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      switch (event) {
        case Submit():
          emit(const RegisterState.loading());
          try {
            final result = await remoteDatasource.register(
              name: event.name,
              email: event.email,
              password: event.password,
              phone: event.phone,
              roles: event.roles,
            );
            emit(RegisterState.success(result));
          } catch (e) {
            emit(RegisterState.error(e.toString()));
          }
          break;
      }
    });
  }
}
