import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/logic/login/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginCubit extends Cubit<CreateLoginState> {
  LoginCubit() : super (
      CreateLoginInitialState());

  final dio = Dio();

  Future<void> logIn({
    required String email,
    required String pass,
  }) async  {
    emit(CreateLoginLoadingState());
    try {
     final response = await dio.post(
         Url.loginUrl, data: {
        "email": email,
        "password": pass,
      });
     if (response.statusCode == 200 || response.statusCode == 201){
       final token =response.data["token"]?? response.data['data']['token'];
       final prefs =await SharedPreferences.getInstance();
       await prefs.setString('auth_token', token);
       final userName = response.data['data']?['name'] ?? 'Guest';
       if(userName.isNotEmpty){
         await prefs.setString('user_name', userName);
       }
       emit(CreateLoginSuccessState());
     }
    } catch (e) {
      print("login error===========${e}");
      emit(CreateLoginErrorState(em: e.toString()));
    }
  }
}
