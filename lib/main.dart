import 'package:flutter/material.dart';
import 'package:test_app_it/view/first_page.dart';
import 'package:test_app_it/view/page_indicator.dart';
import 'package:test_app_it/view/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Тестовое задание'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  late List<Widget> pages;
  final PageController _pageController = PageController();

  @override
  void initState() {
    pages = [
      FirstPage(changePage: (){
        setState(() {
          pageIndex = 1;
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        });
      },),
      SecondPage(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 50,
            child: PageView(
              children: pages,
              controller: _pageController,
              onPageChanged: (value) => {
                setState(() {
                  pageIndex = value;
                })
              },
            ),
          ),
          Positioned(
            bottom: 25,
            left: 10,
            right: 10,
            child: PageIndicator(
              pages.length,
              pageIndex,
              colorActivePhoto: Colors.redAccent,
              colorInActivePhoto: Colors.redAccent.withOpacity(0.55),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
