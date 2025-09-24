import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/logic/sign_up/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit(): super (
      SignUpStatInitialState());
  final dio =Dio();
  Future signUp ({
    required String email ,
    required String password ,
    required String password_confirmation,
    required String gender,
    required String phone,
    required String name,
  })
async{
    try{
      emit(SignUpStatSuccessState());
      Url.registerUrl;
     final repsone=await dio.post(Url.registerUrl,data: {
        "email":email,
        "name":name,
        "phone":phone,
        "gender":gender,
        "password":password,
        "password_confirmation":password_confirmation,
      });
      if (repsone.statusCode == 200 || repsone.statusCode == 201) {
        // ✅ Save name locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_name', name);
      }
    }catch(e){
      print("signup error===========${e}");
      emit(SignUpStatErrorState(em: e.toString()));
    }
  }
}