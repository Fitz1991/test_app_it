import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int numberOfPages;
  final int pageIndex;
  final double indicatorSize;
  final Color colorActivePhoto;
  final Color colorInActivePhoto;

  PageIndicator(
    this.numberOfPages,
    this.pageIndex, {
    Key? key,
    this.indicatorSize = 10,
    this.colorActivePhoto = Colors.black,
    this.colorInActivePhoto = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          List<Widget> indicators = [];
          for (int i = 0; i < numberOfPages; i++) {
            indicators.add(i == pageIndex
                ? ActiveItem(
                    numberOfPages: numberOfPages,
                    colorActivePhoto: colorActivePhoto,
                    indicatorSize: indicatorSize,
                  )
                : InactiveItem(
                    numberOfPages: numberOfPages,
                    colorInActivePhoto: colorInActivePhoto,
                    indicatorSize: indicatorSize,
                  ));
            if(i != numberOfPages - 1){
              indicators.add(
                SizedBox(
                  width: 5,
                )
              );
            }
          }
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: indicators);
        },
      ),
    );
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    Key? key,
    required this.numberOfPages,
    required this.colorActivePhoto,
    required this.indicatorSize,
  }) : super(key: key);

  final int numberOfPages;
  final double indicatorSize;
  final Color colorActivePhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: indicatorSize,
          width: indicatorSize,
          decoration: BoxDecoration(
              color: colorActivePhoto,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 0, blurRadius: 2)]),
        ),
      ),
    );
  }
}

class InactiveItem extends StatelessWidget {
  const InactiveItem({
    Key? key,
    required this.numberOfPages,
    required this.colorInActivePhoto,
    required this.indicatorSize,
  }) : super(key: key);

  final int numberOfPages;
  final Color colorInActivePhoto;
  final double indicatorSize;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 1),
        child: Opacity(
          opacity: 0.50,
          child: Container(
            height: indicatorSize,
            width: indicatorSize,
            decoration: BoxDecoration(color: colorInActivePhoto, borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}
