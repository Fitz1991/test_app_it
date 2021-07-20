import 'package:flutter/material.dart';

typedef ChangePage();

class FirstPage extends StatelessWidget {
  FirstPage({
    Key? key,
    required this.changePage
  }) : super(key: key);

  final ChangePage changePage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text('Next'),
        onPressed: changePage,
      ),
    );
  }
}