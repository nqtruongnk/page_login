import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/model/listItem.dart';

class BuildDetail implements ListItem {
  @override
  Widget buildDetail(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
          ),
          Image.network('src')
        ],
      ),
    );
  }

  @override
  Widget buildImage(BuildContext context) => null;

  @override
  Widget buildTitle(BuildContext context) => null;
}
