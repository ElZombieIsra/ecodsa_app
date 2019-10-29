import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthpageBloc extends Bloc<AuthpageEvent, AuthpageState> {
  @override
  AuthpageState get initialState => InitialAuthpageState();

  @override
  Stream<AuthpageState> mapEventToState(
    AuthpageEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
