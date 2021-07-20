import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_it/domain/second_page_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecondPageBloc>(
      create: (context) => SecondPageBloc()..add(GetData()),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SecondPageBloc, SecondPageState>(
            builder: (context, state) {
              if (state is SuccessData) {
                return Text(state.data);
              }
              if (state is LoadingData) {
                return CircularProgressIndicator();
              }
              if(state is FailureData){
                return Text(state.errorMessage);
              }
              else{
                return Text('Пустая страница');
              }
            },
          ),
        ),
      ),
    );
  }
}
