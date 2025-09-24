import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core&colors/const/yrl.dart';
import 'package:untitled/core&colors/helper/helper.dart';
import 'package:untitled/data/doctor_model.dart';
import 'package:untitled/logic/search/state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> allDoctor = [];

  final Map<String, String> doctorImages = {
    "Dr. Randy Wigham": "assets/images/Randy.png",
    "Dr. Jack Sulivan": "assets/images/Susan.png",
    "Drg. Hanna Stanton": "assets/images/Image (4).png",
    "Dr. Emery Lubin": "assets/images/Image (5).png",
  };

  /// Core function: search by query and/or specialty
  Future<void> getAllDoctors() async {
    emit(SearchLoadingState());
    try {
      final response = await DioHelper.get(
          Url.doctorIndex); // ✅ endpoint for all doctors
      if (response.statusCode == 200) {
        final rawData = response.data['data'];

        if (rawData is List) {
          allDoctor = rawData
              .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          allDoctor = [];
        }

        emit(SearchSuccessState(allDoctor));
      } else {
        emit(SearchErrorState(em: '${response.statusCode}'));
      }
    } catch (e) {
      emit(SearchErrorState(em: e.toString()));
    }
  }

  Future<void> filterBySpecialty(dynamic specialtyId) async {
    if (specialtyId == null) {
      await getAllDoctors(); // ✅ show all doctors
      return;
    }

    await searchDoctors(
      query: "", // no name filter
      specialtyId: int.tryParse(specialtyId.toString()), // safely convert
    );
  }

  Future<void> searchDoctors({String? query, int? specialtyId}) async {
    emit(SearchLoadingState());
    try {
      final response = await DioHelper.get(
        Url.searchIndex,
        query: {
          if (query != null && query.isNotEmpty) 'name': query,
          if (specialtyId != null) 'specialization_id': specialtyId.toString(),
        },
      );

      if (response.statusCode == 200) {
        final rawData = response.data['data'];

        if (rawData is List) {
          allDoctor = rawData
              .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else if (rawData is Map<String, dynamic>) {
          allDoctor = [DoctorModel.fromJson(rawData)];
        } else {
          allDoctor = [];
        }

        emit(SearchSuccessState(allDoctor));
      } else {
        emit(SearchErrorState(em: '${response.statusCode}'));
      }
    } catch (e) {
      emit(SearchErrorState(em: e.toString()));
    }
  }
}
