import 'package:flutter/material.dart';

class GridViewExtentWidget extends StatelessWidget {
  const GridViewExtentWidget({
    Key key,
    @required List<IconData> iconList,
  }) : _iconList = iconList, super(key: key);

  final List<IconData> _iconList;

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 175.0,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8.0),
      children: List.generate(20, (index) {
        print('_buildGridViewExtent $index');

        return Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[index],
                  size: 48.0,
                  color: Colors.blue,
                ),
                Divider(),
                Text(
                  'Index $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            onTap: () {
              print('Row $index');
            },
          ),
        );
      }),
    );
  }
}