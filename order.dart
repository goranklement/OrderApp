import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr/orderModel.dart';


class OrderView extends StatefulWidget {
  const OrderView({super.key, required this.numbers});
   final List<int> numbers;


  @override
  State<OrderView> createState() => _OrderViewState();
  
}

class _OrderViewState extends State<OrderView> {
  List<Object> orders=[];
  List<Widget> widgeti=[];
  Timer? timer;
  final _ordersRef= FirebaseDatabase.instance.ref('Orders');
  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text("List of orders"),
      ),
     body: Column(
      children: [
        ElevatedButton(onPressed: () async {
            orders=[];
            widgeti.clear();
          for(int i=0;i<widget.numbers.length;i++){
            String broj= widget.numbers[i].toString();
            DatabaseReference starCountRef =
                    FirebaseDatabase.instance.ref('Orders/$broj');
            starCountRef.onValue.listen((DatabaseEvent event) {
                var data = event.snapshot.value;
                if(data!=null)
                setState(() {
                  
                  orders.add(data);
              //  widgeti.add(OrderModel(tableNumber: broj, order: data.toString()));
                });
                
            });
               
          }
}, child: Text("Get orders")),
        /*ListBody(
          children: widgeti,
        ) */

        Expanded(child: FirebaseAnimatedList(query:_ordersRef , itemBuilder: ((context, snapshot, animation, index) { 
          if(widget.numbers.contains(int.parse(snapshot.key.toString())))
          {
          return ListBody(
                      children:[
                        OrderModel(tableNumber: snapshot.key.toString(), order: snapshot.value.toString(), ikona: IconButton(color:Colors.white,iconSize: 40 ,icon: Icon(Icons.delete), onPressed: () => _ordersRef.child(snapshot.key!).remove(),),),
                      ] 

                  );

          }
 
        else return SizedBox(
          width: 1,
        );
          
        }))) 
      ],
      
     ),
    );
  }
}
