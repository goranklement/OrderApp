import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'colors.dart';

class OrderModel extends StatelessWidget {
  const OrderModel({super.key, required this.tableNumber, required this.order});
  final String tableNumber;
  final String order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
     padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: getColor(0xffba76cf),
        borderRadius: BorderRadius.circular(30)
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(tableNumber, style: TextStyle(
            color: getColor(0xff716575),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          )),
          SizedBox(width: 15,),
          Expanded(
            child: Text(order,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
          )],
        ),
    );
  }
}