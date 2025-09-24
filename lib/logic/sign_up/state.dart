class SignUpState{}
class SignUpStatInitialState extends SignUpState{}
class SignUpStatLoadingState extends SignUpState{}
class SignUpStatSuccessState extends SignUpState{}
class SignUpStatErrorState extends SignUpState{
  final String em;
  SignUpStatErrorState ({required this.em });
}
