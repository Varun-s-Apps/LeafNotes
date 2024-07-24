part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}


final class UserLoading extends UserState {}


final class UserLoaded extends UserState {
  final UserModel user;

  UserLoaded(this.user);
  
  @override
  List<Object> get props => [user];

}


final class UserFailure extends UserState {}

