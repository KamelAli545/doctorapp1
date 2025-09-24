import 'package:untitled/data/doctor_model.dart';

class RecomndState{}
  class RecomndInitialState extends RecomndState {}
  class RecomndLoadingState extends RecomndState {}
  class RecomndSuccessState extends RecomndState
{
  final List<DoctorModel> doctormodel;
  RecomndSuccessState(this.doctormodel);
  }
  class RecomndErrorState extends RecomndState
{
    final String em;
    RecomndErrorState ({required this.em });
  }


