import 'package:flutter/material.dart';
import 'package:ch9_gridview_playground/classes/grid_icons.dart';
import 'package:ch9_gridview_playground/widgets/gridview_count.dart';
import 'package:ch9_gridview_playground/widgets/gridview_extent.dart';
import 'package:ch9_gridview_playground/widgets/gridview_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Widget _gridView;
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();

    _iconList = GridIcons().getIconList();
    _gridView = GridViewCountWidget(iconList: _iconList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView - Playground'),
      ),
      body: SafeArea(
        child: _gridView,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('Count'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_off),
            title: Text('Extent'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('Builder'),
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      if (selectedIndex == 0) {
        _gridView = GridViewCountWidget(iconList: _iconList);
      }
      else if (selectedIndex == 1) {
        _gridView = GridViewExtentWidget(iconList: _iconList);
      }
      else if (selectedIndex == 2) {
        _gridView = GridViewBuilderWidget(iconList: _iconList);
      }
    });
  }
}








