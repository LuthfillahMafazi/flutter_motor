import 'package:flutter/material.dart';
import 'style.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Container> layout = List();

  _createDataList() {
    for (var i = 0; i < dataMotor.length; i++) {
      final listFood = dataMotor[i];
      final String image = listFood.image;
      final String name = listFood.name;
      final String desc = listFood.description;
      final String price = listFood.price;

      layout.add(Container(
        padding: EdgeInsets.all(16.0),
        height: 250.0,
        child: Stack(
          children: <Widget>[
            // backgroundImage(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.luminosity),
                      image: AssetImage("images/$image"))),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 80.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          name,
                          style: bigHeaderTextStyle,
                        ),
                        Text(
                          desc,
                          style: descTextStyle,
                        ),
                        Container(
                          height: 2.0,
                          width: 80.0,
                          color: Colors.redAccent,
                        ),
                        Text(
                          price,
                          style: footerTextStyle,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ));
    }
  }

  // backgroundImage(String image) {
  //   Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20.0),
  //         image: DecorationImage(
  //             fit: BoxFit.fill,
  //             colorFilter: ColorFilter.mode(
  //                 Colors.black.withOpacity(0.5), BlendMode.luminosity),
  //             image: AssetImage(image))),
  //   );
  // }

  // topContent(String name, String description, String price) {
  //   Container(
  //     height: 80.0,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       mainAxisSize: MainAxisSize.max,
  //       children: <Widget>[
  //         Text(
  //           name,
  //           style: bigHeaderTextStyle,
  //         ),
  //         Text(
  //           description,
  //           style: descTextStyle,
  //         ),
  //         Text(
  //           price,
  //           style: footerTextStyle,
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  void initState() {
    _createDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: layout,
        ),
      ),
    );
  }
}