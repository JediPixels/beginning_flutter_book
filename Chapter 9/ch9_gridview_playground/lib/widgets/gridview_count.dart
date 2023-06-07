import 'package:flutter/material.dart';

class GridViewCountWidget extends StatelessWidget {
  const GridViewCountWidget({
    Key key,
    @required List<IconData> iconList,
  }) : _iconList = iconList, super(key: key);

  final List<IconData> _iconList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      //scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8.0),
      children: List.generate(7000, (index) {
        print('_buildGridView $index');

        return Card(
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[0],
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
      },),
    );
  }
}