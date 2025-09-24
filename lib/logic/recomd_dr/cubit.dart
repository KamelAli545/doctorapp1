import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/logic/recomd_dr/state.dart';

class RecomdDrCubit extends Cubit<RecomndState> {
  RecomdDrCubit() : super(RecomndInitialState());

  static RecomdDrCubit get(context) => BlocProvider.of(context);
  List<DoctorModel> allDoctor = [];
  final Map<String, String> doctorImages = {
    "Dr. Randy Wigham": "assets/images/Randy.png",
    "Dr. Jack Sulivan": "assets/images/Susan.png",
    "Drg. Hanna Stanton": "assets/images/Image (4).png",
    "Dr. Emery Lubin": "assets/images/Image (5).png",
  };

  Future<void> getDoctors() async {
    if (state is RecomndSuccessState && allDoctor.isNotEmpty) return;
    emit(RecomndLoadingState());

    try {
      final response = await DioHelper.get(Url.doctorIndex);

      if (response.statusCode == 200) {
        final rawData = response.data['data'];

        print("👉 rawData: $rawData");
        print("👉 rawData type: ${rawData.runtimeType}");

        if (rawData is List) {
          // Multiple doctor
          allDoctor = rawData.map((e)=>DoctorModel.fromJson(e as Map<String,dynamic>)).toList();
        } else if (rawData is Map<String,dynamic>) {
          // Single doctor
          allDoctor =[DoctorModel.fromJson(rawData)];
        } else {
          allDoctor = [];
        }
        for (var doctor in allDoctor) {
          doctor.imagePath =
              doctorImages[doctor.name] ?? null;
        }
        emit(RecomndSuccessState(allDoctor));
      } else {
        emit(RecomndErrorState(em: '${response.statusCode}'));
      }
    } catch (e) {
      emit(RecomndErrorState(em: e.toString()));
    }
  }
}
