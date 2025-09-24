class CreateLoginState{}
class CreateLoginInitialState extends CreateLoginState{}
class CreateLoginLoadingState extends CreateLoginState{}
class CreateLoginSuccessState extends CreateLoginState{}
class CreateLoginErrorState extends CreateLoginState{
  final String em;
  CreateLoginErrorState ({required this.em });
}


