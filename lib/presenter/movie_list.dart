

import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: BlankPage(),
    );
  }

}

/*
* Widget for blank page
*/
class BlankPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Blank page"),
      ),
    );
  }
}