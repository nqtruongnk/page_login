import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_screen/model/listItem.dart';

class Title implements ListItem {
  @override
  Widget buildDetail(BuildContext context) => null;

  @override
  Widget buildImage(BuildContext context) => null;

  @override
  Widget buildTitle(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image(image: null),
          Container(
            child: Column(
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
