import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/core&colors/helper/sharedPref.dart';
import 'package:untitled/logic/login/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class LoginCubit extends Cubit<CreateLoginState> {
  LoginCubit() : super (
      CreateLoginInitialState());
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();


  final dio = Dio();

  Future<void> logIn({
    required String email,
    required String pass,
    bool rememberMe = false,
  }) async {
    emit(CreateLoginLoadingState());
    try {
      final response = await DioHelper.post(
        Url.loginUrl,
        data: {"email": email, "password": pass},
      );

      print(" Login Response: ${response.data}");

      if (DioHelper.isSuccess(response)) {
        final token = response.data['data']?["token"];
        final username = response.data['data']?["username"];

        if (token != null && token.isNotEmpty) {
          await _prefsHelper.saveRegistrationToken(token);
          await _prefsHelper.saveRememberMe(rememberMe);

          if (token != null && token.isNotEmpty) {
            await _prefsHelper.saveRegistrationToken(token);
            await _prefsHelper.saveRememberMe(rememberMe);

            Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
            final userId = decodedToken["sub"];
            if (userId != null) {
              await _prefsHelper.saveUserId(int.parse(userId.toString()));
            }

            await DioHelper.saveAuthToken(token);

            print(
                ' تم حفظ التوكن: $token - والـ userId: $userId (RememberMe: $rememberMe)');
            emit(CreateLoginsSuccessState(response.data));
          }
        } else {
          emit(CreateLoginErrorState(
              em: "لم يتم العثور على التوكن في الاستجابة"));
        }
      } else {
        emit(
            CreateLoginErrorState(em: "خطأ غير متوقع: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CreateLoginErrorState(em: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(CreateLoginLoadingState());
    try {
      final token = await _prefsHelper.getRegistrationToken();

      if (token != null && token.isNotEmpty) {
        // Example: call your API
        final response = await Dio().post(
          Url.logOutUrl,
          options: Options(
          headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        },
        )
    ,);

    if (response.statusCode == 200) {
    // clear token locally
    await _prefsHelper.clearRegistrationToken();
    emit(CreateLoginsSuccessState({"message": "تم تسجيل الخروج"}));
    } else {
    emit(CreateLoginErrorState(em: "فشل تسجيل الخروج من السيرفر"));
    }
    } else {
    emit(CreateLoginErrorState(em: "لا يوجد توكن مسجل"));
    }
    } catch (e) {
    emit(CreateLoginErrorState(em: e.toString()));
    }
  }

}
