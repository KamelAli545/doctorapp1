import 'package:untitled/data/doctor_model.dart';

class SpecialityState{}
  class SpecialityInitialState extends SpecialityState{}
  class SpecialityLoadingState extends SpecialityState{}
  class SpecialitySuccessState extends SpecialityState{
  final List<SpecializationWithDoctors> specialization;
  SpecialitySuccessState(this.specialization);
  }
  class SpecialityErrorState extends SpecialityState{
    final String em;
    SpecialityErrorState ({required this.em });
  }


