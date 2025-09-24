
import 'package:untitled/data/appointment.dart';
class AppointmentPostStates {}

class AppointmentPostInitialState extends AppointmentPostStates {}

class AppointmentPostLoadingState extends AppointmentPostStates {}

class AppointmentPostSuccessState extends AppointmentPostStates {
final AppointmentModel appointment;
  AppointmentPostSuccessState(this.appointment);
}

class AppointmentPostErrorState extends AppointmentPostStates {
  final String errorMessage;
  AppointmentPostErrorState(this.errorMessage);
}
