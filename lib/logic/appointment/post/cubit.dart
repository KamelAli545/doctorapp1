import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'state.dart';
import 'package:untitled/data/appointment.dart';
import 'package:untitled/core&colors/const/yrl.dart';
class AppointmentPostCubit extends Cubit<AppointmentPostStates> {
  AppointmentPostCubit() : super(AppointmentPostInitialState());

  void searchDoc(String docName){
    DioHelper.get("/doctor/doctor-search?name=$docName");
  }

  void createAppointment({required AppointmentModel appointment}) async {
    emit(AppointmentPostLoadingState());
    try {
      final formattedTime = DioHelper.formatAppointment(appointment.appointmentTime);

      final response = await DioHelper.post(
        Url.appointmentStore,
        data: {
          'doctor_id': appointment.doctor.id,
          'start_time': formattedTime,
          'notes': appointment.notes,
        },
      );

      if (DioHelper.isSuccess(response) && response.data['status'] == true) {
        final appointment = AppointmentModel.fromJson(response.data['data']);
        emit(AppointmentPostSuccessState(appointment));
      } else {
        emit(AppointmentPostErrorState('Failed to create appointment: ${response.data['message'] ?? response.statusCode}'));
      }
    } catch (e) {
      emit(AppointmentPostErrorState('Error: $e'));
    }
  }
}