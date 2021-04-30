import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/model/listItem.dart';

abstract class BuildImage implements ListItem {
  @override
  Widget buildDetail(BuildContext context) => null;

  @override
  Widget buildImage(BuildContext context) {
    return Image.network('src');
  }

  @override
  Widget buildTitle(BuildContext context) => null;
}
