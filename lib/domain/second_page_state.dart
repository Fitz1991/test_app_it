part of 'second_page_bloc.dart';

@immutable
abstract class SecondPageState {}

class SecondPageInitial extends SecondPageState {}

class LoadingData extends SecondPageState {}

class SuccessData extends SecondPageState {
  String data;
  SuccessData(this.data);
}

class FailureData extends SecondPageState {
  String errorMessage;

  FailureData(this.errorMessage);
}
