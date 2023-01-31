part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initialization() = _Initialization;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.loggedIn(Student student) = _Loaded;
  const factory AuthState.error(String message) = _Error;
}
