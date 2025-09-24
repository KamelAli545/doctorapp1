import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/logic/dr_spec/state.dart';

class DrSpecialityCubit extends Cubit<DrSpecialtiyState> {
  DrSpecialityCubit() : super(DrSpecialtiyInitialState());

  static DrSpecialityCubit get(context) => BlocProvider.of(context);
  List<SpecializationWithDoctors> allSpecialization = [];

  Future<void> getSpecializations() async {
    if (state is DrSpecialtiySuccessState && allSpecialization.isNotEmpty) return;
    emit(DrSpecialtiyLoadingState());

    try {
      final response = await DioHelper.get(Url.specializationIndex);

      if (response.statusCode == 200) {
        final rawData = response.data['data'];

        print("👉 rawData: $rawData");
        print("👉 rawData type: ${rawData.runtimeType}");

        if (rawData is Map<String, dynamic>) {
          // Single specialization
          allSpecialization = [SpecializationWithDoctors.fromJson(rawData)];
        } else if (rawData is List) {
          // Multiple specializations
          allSpecialization = rawData
              .map((e) => SpecializationWithDoctors.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          allSpecialization = [];
        }

        emit(DrSpecialtiySuccessState(allSpecialization));
      } else {
        emit(DrSpecialtiyErrorState(em: '${response.statusCode}'));
      }
    } catch (e) {
      emit(DrSpecialtiyErrorState(em: e.toString()));
    }
  }
}
