abstract class GetInTouchState {}

class GetInTouchInitial extends GetInTouchState {}

class GetInTouchLoading extends GetInTouchState {}

class GetInTouchSuccess extends GetInTouchState {}

class GetInTouchFailure extends GetInTouchState {
  final String error;
  GetInTouchFailure({required this.error});
}
