import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/profile/profile_bloc.dart';
import '../../core/models/user_model.dart';
import '../../core/validations.dart';
import '../core/loading.dart';
import '../core/snack_bar.dart';
import 'components/app_bar_personal_info.dart';
import 'components/gender_personal_info.dart';
import 'components/single_input_personal_info.dart';
import 'components/title_personal_info.dart';

class PersonalInfo extends StatelessWidget {
  final User user;
  final UserModel userModel;

  PersonalInfo({
    Key key,
    @required this.user,
    this.userModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(user: user, userModel: userModel)..add(ScreenStarded()),
      child: PersonalInfoPage(),
    );
  }
}

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  ProfileBloc profileBloc;

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: PersonalInfoAppBar(
        onTap: () {
          if (validateAndSave(formKey)) {
            profileBloc.add(SubmitEvent());
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (contextListener, state) {
              if (state is SuccessState) {
                buildSuccesSnackBar(contextListener, state.message);
              } else if (state is FailState) {
                buildWarningSnackBar(contextListener, state.message);
              }
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Loading();
                } else {
                  return ProfileEditingForm(
                    formKey: formKey,
                    profileBloc: profileBloc,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileEditingForm extends StatelessWidget {
  ProfileEditingForm({
    Key key,
    @required this.formKey,
    @required this.profileBloc,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final ProfileBloc profileBloc;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = profileBloc.gender;
    return Form(
      key: formKey,
      child: Column(
        children: [
          PersonalInfoTitle(),
          SingleInputPersonalInfo(
            labelText: "Nome",
            initialValue: profileBloc.name,
            onChanged: (value) {
              profileBloc.setName(value);
            },
          ),
          SingleInputPersonalInfo(
            labelText: "Sobrenome",
            initialValue: profileBloc.lastname,
            onChanged: (value) {
              profileBloc.setLastname(value);
            },
          ),
          GenderInput(
            controller: _controller,
            onChanged: (value) {
              profileBloc.setGender(value);
              _controller.text = value;
              Navigator.pop(context);
              profileBloc.add(ScreenStarded());
            },
          ),
          SingleInputPersonalInfo(
            readOnly: true,
            labelText: "Email",
            initialValue: profileBloc.email,
            onChanged: (value) {
              profileBloc.setEmail(value);
            },
          )
        ],
      ),
    );
  }
}
