import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/logic/doc_home/static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import '../../data/doctor_model.dart';

class DoctorHomeCubit extends Cubit<DocHome> {
  DoctorHomeCubit() : super(DocHomeInitialState());

  static DoctorHomeCubit get(context) => BlocProvider.of(context);
  List<DoctorModel> allDoctors = [];
  Future<void> getDoctors() async {

    if (state is DocHomeSuccessState && allDoctors.isNotEmpty) return;

    emit(DocHomeLoadingState());

    try {
      final hasToken = await DioHelper.hasAuthToken();
      if (!hasToken) {
        emit(DocHomeErrorState('you have to login first'));
        return;
      }

      final response = await DioHelper.dio.get(Url.homeIndex);

      if (response.statusCode == 200) {
        final ApiResponse apiResponse = ApiResponse.fromJson(response.data);

        allDoctors.clear();
        for (var specialization in apiResponse.data) {
          allDoctors.addAll(specialization.doctors);
        }

        emit(DocHomeSuccessState(allDoctors));
      } else if (response.statusCode == 401) {
        emit(DocHomeErrorState('login again plz'));
      } else {
        emit(DocHomeErrorState(' LOGIN Again : ${response.statusCode}'));
      }
    } catch (e) {
      emit(DocHomeErrorState(' something wrong: $e'));
    }
  }


  Future<List<SpecializationWithDoctors>> getSpecializationsWithDoctors() async {
    try {
      final response = await DioHelper.dio.get(Url.homeIndex);

      if (response.statusCode == 200) {
        final ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        return apiResponse.data;
      } else {
        throw Exception('  try again: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(' something wrong: $e');
    }
  }
}