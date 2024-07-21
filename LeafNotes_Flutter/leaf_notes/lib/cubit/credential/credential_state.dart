part of 'credential_cubit.dart';

abstract class CredentialState extends Equatable{
  const CredentialState();

  
  }


final class CredentialInitial extends CredentialState {
  @override

  List<Object?> get props => [];
}

final class CredentialLoading extends CredentialState {
  @override

  List<Object?> get props => [];
}

final class CredentialSuccess extends CredentialState {
  final UserModel user;

  CredentialSuccess(this.user);



  @override
  List<Object?> get props => [];
}

final class CredentialFailure extends CredentialState {

  final String errorMessage;

  CredentialFailure(this.errorMessage);
  
  @override

  List<Object?> get props => [errorMessage];
}
