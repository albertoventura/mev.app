import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  String exchangeEmpty = 'We dont have this exchange';
  String coinEmpty = 'We dont have this coin';
  bool isCoin;

  EmptyWidget(this.isCoin);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 35.0,
      child: Text(isCoin ? coinEmpty : exchangeEmpty,
          style: TextStyle(fontSize: 15.0, color: Colors.grey[600])),
    );
  }
}
