import 'package:flutter/cupertino.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildImage(BuildContext context);
  Widget buildDetail(BuildContext context);
}
