import 'package:flutter/material.dart';
import 'package:login_screen/model/listProduct.dart';

class MainLogin extends StatefulWidget {
  MainLogin({Key key}) : super(key: key);

  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  ListData listProduct = ListData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listProduct.products.length,
            itemBuilder: (context, index) {
              return Card();
            }),
      ),
    );
  }
}
