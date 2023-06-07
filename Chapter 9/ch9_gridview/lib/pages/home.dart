import 'package:flutter/material.dart';
import 'package:ch9_gridview/widgets/gridview_builder.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.builder'),
      ),
      body: SafeArea(
        child: const GridViewBuilderWidget(),
      ),
    );
  }

}