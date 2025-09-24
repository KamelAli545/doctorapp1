class CreateLoginState{}
class CreateLoginInitialState extends CreateLoginState{}
class CreateLoginLoadingState extends CreateLoginState{}
class CreateLoginsSuccessState extends CreateLoginState {
  final Map<String, dynamic> data;
  CreateLoginsSuccessState(this.data);
}
class CreateLoginErrorState extends CreateLoginState{
  final String em;
  CreateLoginErrorState ({required this.em });
}


