part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class AppStartedEvent extends AuthEvent {}

class LoginEmailEvent extends AuthEvent {
  final String email;
  final String senha;

  LoginEmailEvent({@required this.email, @required this.senha});

  @override
  List<Object> get props => [email, senha];
}

class CreateLoginEmailEvent extends AuthEvent {
  final String email;
  final String senha;
  final String nome;
  final String sobrenome;
  final String gender;

  CreateLoginEmailEvent(
      {@required this.email,
      @required this.senha,
      @required this.nome,
      @required this.sobrenome,
      @required this.gender});

  @override
  List<Object> get props => [nome, sobrenome, email, senha, gender];
}

class LogoutEvent extends AuthEvent {}

class SignupEvent extends AuthEvent {}

class ExitEvent extends AuthEvent {}

class ToWelcomeEvent extends AuthEvent {}

class ForgotEvent extends AuthEvent {}

class LoginSuccessEvent extends AuthEvent {}

class SignupPressedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

class RequestNewPasswordEvent extends AuthEvent {
  final String email;

  RequestNewPasswordEvent({@required this.email});

  @override
  List<Object> get props => [email];
}

class SignupSuccessEvent extends AuthEvent {
  final User user;
  final UserModel userModel;

  SignupSuccessEvent({@required this.userModel, @required this.user});
}

class LoginGoogleEvent extends AuthEvent {}
