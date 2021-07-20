import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'second_page_event.dart';
part 'second_page_state.dart';

class SecondPageBloc extends Bloc<SecondPageEvent, SecondPageState> {
  SecondPageBloc() : super(SecondPageInitial());

  @override
  Stream<SecondPageState> mapEventToState(
    SecondPageEvent event,
  ) async* {
    if(event is GetData){
      yield* _getData();
    }
  }

  Stream<SecondPageState> _getData() async* {
    yield LoadingData();
    try {
      Dio dio = new Dio();
      dio.options.headers["Authorization"] = "sim-sim";
      var response = await dio.get('https://us-central1-gettheemailtest.cloudfunctions.net/start');
      yield SuccessData(response.data);
    }catch (e){
      print(e);
      yield FailureData(e.toString());
    }
  }

}
