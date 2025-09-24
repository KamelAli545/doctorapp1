import 'package:untitled/data/doctor_model.dart';

class DrSpecialtiyState{}
  class DrSpecialtiyInitialState extends DrSpecialtiyState{}
  class DrSpecialtiyLoadingState extends DrSpecialtiyState{}
  class DrSpecialtiySuccessState extends DrSpecialtiyState{
  final List<SpecializationWithDoctors> specialization;
  DrSpecialtiySuccessState(this.specialization);
  }
  class DrSpecialtiyErrorState extends DrSpecialtiyState{
    final String em;
    DrSpecialtiyErrorState ({required this.em });
  }


