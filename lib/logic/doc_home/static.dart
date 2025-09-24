import 'package:untitled/data/doctor_model.dart';

class DocHome{}
class DocHomeInitialState extends DocHome{}
class DocHomeLoadingState extends DocHome{}
class DocHomeSuccessState extends DocHome{
  final List<DoctorModel>doctors;
  DocHomeSuccessState(this.doctors);
}
class DocHomeErrorState extends DocHome{
  final String em;
  DocHomeErrorState(this.em);
}


