import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String title;
  final String img;
  final int price;
  final String detail;
  const DetailProduct({Key key, this.title, this.img, this.price, this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: Image.network(
              '${img}',
              width: 500,
              fit: BoxFit.cover,
            )),
            Container(
                //margin: EdgeInsets.only(top: 10),
                child: Text('Price: ${price}')),
            Text('${detail}')
          ],
        ),
      ),
    );
  }
}
