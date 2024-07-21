part of 'auth_cubit.dart';


abstract class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}


final class Authenticated extends AuthState {
  final String uid;

  const Authenticated(this.uid);

  @override
  List<Object?> get props => [uid];
}


final class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

