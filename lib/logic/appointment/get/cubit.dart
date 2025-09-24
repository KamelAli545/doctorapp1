import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/data/appointment.dart';
import 'state.dart';

class AppointmentGetCubit extends Cubit<AppointmentGetStates> {
  AppointmentGetCubit() : super(AppointmentGetInitialState());

  List<AppointmentModel> appointments = [];

  void getAppointments() async {
    emit(AppointmentGetLoadingState());
    try {
      final response = await DioHelper.get(Url.appointmentIndex);

      if (DioHelper.isSuccess(response) && response.data['status'] == true) {
        final rawData = response.data['data'] as List?;
        appointments = rawData != null
            ? rawData.map((e) => AppointmentModel.fromJson(e)).toList()
            : [];
        emit(AppointmentGetSuccessState(appointments));
      } else {
        emit(AppointmentGetErrorState('Failed to fetch data: ${response.statusCode}'));
      }
    } catch (e) {
      emit(AppointmentGetErrorState('Error: $e'));
    }
  }
}