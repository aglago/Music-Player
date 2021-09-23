import 'package:flutter/material.dart';

class AllPackageTesting extends StatefulWidget {
  const AllPackageTesting({Key? key}) : super(key: key);

  @override
  _AllPackageTestingState createState() => _AllPackageTestingState();
}

class _AllPackageTestingState extends State<AllPackageTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // A fixed-height child.
                            color: Colors.white,
                            height: 120.0,
                          ),
                          Expanded(
                            // A flexible child that will grow to fit the viewport but
                            // still be at least as big as necessary to fit its contents.
                            child: Container(
                              color: Colors.blue,
                              //height: 120.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.red[100],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.red[200],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.red[300],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 150,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.green[100],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 200,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.green[200],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 250,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.green[300],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 300,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.yellow[100],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 350,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.yellow[200],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 400,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.yellow[300],
                                      child: SizedBox(
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }}
