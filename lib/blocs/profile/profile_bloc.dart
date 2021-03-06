import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../core/errors/auth_error.dart';
import '../../core/models/user_model.dart';
import '../../resources/auth/firebase_auth.dart';
import '../../resources/user/firebase_user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final User user;
  final UserModel userModel;
  ProfileBloc({this.userModel, this.user}) : super(ProfileInitial());
  final UsersRepository usersRepository = UsersRepository();
  final AuthRepository authRepository = AuthRepository();

  get name => userModel.name;
  get email => userModel.email;
  get lastname => userModel.lastname;
  get gender => userModel.gender;

  setName(String value) => userModel.name = value.trim();
  setEmail(String value) => userModel.email = value.trim();
  setLastname(String value) => userModel.lastname = value.trim();
  setGender(String value) => userModel.gender = value.trim();

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
        await user.updateDisplayName(userModel.name);
        bool inserted = await usersRepository.updateUser(
            user.uid,
            userModel.name,
            userModel.lastname,
            userModel.email,
            userModel.gender);
        if (inserted) {
          yield LoadingState();
          yield SuccessState(message: 'Dados atualizados');
        } else {
          yield LoadingState();
          yield FailState(
              message:
                  'Seu usuário não foi atualizado, entre em contato com o suporte!');
        }
      } catch (e) {
        yield LoadingState();
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
