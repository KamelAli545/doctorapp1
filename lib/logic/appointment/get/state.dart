import 'package:untitled/data/appointment.dart';
class AppointmentGetStates {}

class AppointmentGetInitialState extends AppointmentGetStates {}

class AppointmentGetLoadingState extends AppointmentGetStates {}

class AppointmentGetSuccessState extends AppointmentGetStates {
  final List<AppointmentModel> appointments;
  AppointmentGetSuccessState(this.appointments);
}

class AppointmentGetErrorState extends AppointmentGetStates {
  final String errorMessage;
  AppointmentGetErrorState(this.errorMessage);
}
