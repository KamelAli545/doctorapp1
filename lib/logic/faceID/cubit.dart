// import 'package:appoinment_app/logic/faceID/state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:local_auth/local_auth.dart';
//
// class FaceCubit extends Cubit<FaceID>{
//   FaceCubit():super(FaceInitailState());
//   final LocalAuthentication auth = LocalAuthentication();
//   Future authenticate() async {
//     try {
//       bool authenticated = await auth.authenticate(
//         localizedReason: 'Scan your face to enable Face ID',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//         ),
//       );
//       if (authenticated) {
//         // Success logic here
//         emit(FaceSuccessState()
//         );
//       } else {
//         emit(FaceLoadingState());
//       }
//     } catch (e) {
//       emit(FaceErrorState(em: e.toString()));
//     }
//   }
//
// }