class FaceID{}
class FaceInitailState extends FaceID{}
class FaceLoadingState extends FaceID{}
class FaceSuccessState extends FaceID{}
class FaceErrorState extends FaceID{
  final String em;
  FaceErrorState({required this .em});
}