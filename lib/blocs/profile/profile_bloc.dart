import 'dart:async';

import 'package:aloquei_app/resources/user/firebase_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../core/errors/auth_error.dart';
import '../../core/models/user_model.dart';
import '../../resources/auth/firebase_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final User user;
  final UserModel userModel;
  ProfileBloc({this.userModel, this.user}) : super(ProfileInitial());
  final UsersRepository usersRepository = UsersRepository();
  final AuthRepository authRepository = AuthRepository();

  String _name, _lastname, _email, _gender = '';

  String get getEmail => userModel.email;

  String get getName => userModel.name;

  String get getLastname => userModel.name;

  String get getGender => userModel.gender;

  setName(String value) => _name = value.trim();
  setEmail(String value) => _email = value.trim();
  setLastname(String value) => _lastname = value.trim();
  setGender(String value) => _gender = value.trim();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ScreenStarded) {
      yield LoadingState();
      yield ProfileLoadedState();
    } else if (event is SubmitEvent) {
      yield LoadingState();
      try {
        await user.updateDisplayName(_name);
        bool inserted = await usersRepository.updateUser(
            user.uid, _name, _lastname, _email, _gender);
        if (inserted) {
          yield LoadingEndState();
          yield SuccessState(message: 'Dados atualizados');
        } else {
          yield LoadingEndState();
          yield FailState(
              message:
                  'Seu usuário não foi atualizado, entre em contato com o suporte!');
        }
      } catch (e) {
        yield LoadingEndState();
        yield FailState(message: authErrorHandler(e));
      }
    } else if (event is SendPasswordRecover) {
      try {
        await authRepository.requestNewPassword(user.email);
        yield SuccessState(message: 'E-mail de alteração de senha enviado');
      } catch (e) {
        yield FailState(message: authErrorHandler(e));
      }
    }
  }
}
