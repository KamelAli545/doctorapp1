import 'package:untitled/data/doctor_model.dart';

class SearchState{}
  class SearchInitialState extends SearchState {}
  class SearchLoadingState extends SearchState {}
  class SearchSuccessState extends SearchState
{
  final List<DoctorModel> doctormodel;
  SearchSuccessState(this.doctormodel);
  }
  class SearchErrorState extends SearchState
{
    final String em;
    SearchErrorState ({required this.em });
  }


