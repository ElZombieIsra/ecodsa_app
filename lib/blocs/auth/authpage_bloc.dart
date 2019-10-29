import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../models/user.dart';
import '../../services/api.dart';

class AuthpageBloc extends Bloc<AuthpageEvent, AuthpageState> {
  final EcodsaApi api = EcodsaApi();
  @override
  AuthpageState get initialState => InitialAuthpageState();

  @override
  Stream<AuthpageState> mapEventToState(
    AuthpageEvent event,
  ) async* {
    if (event is AuthPageRegister) {
      yield LoadingAuthpageState();
      User user = await api.register(event.name, event.email, event.password);
      yield LoadedAuthpageState(user);
    }
  }
}
