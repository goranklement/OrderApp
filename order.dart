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
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.numbers.toString()),
      ),
     body: Column(
      children: [
        ElevatedButton(onPressed: () async {
            orders=[];
          for(int i=0;i<widget.numbers.length;i++){
            String broj= widget.numbers[i].toString();
            DatabaseReference starCountRef =
                    FirebaseDatabase.instance.ref('Orders/$broj');
            starCountRef.onValue.listen((DatabaseEvent event) {
                var data = event.snapshot.value;
                if(data!=null)
                setState(() {
                  
                  orders.add(data);
                });
                
            });
               
          }
}, child: Text("Get orders")),
        OrderModel(tableNumber: "1", order: "PAOSJDOPASDOPPDJADSOPASDJDPOAJSDPOAPDSJPSADJPOAJDSPJASPDOJPASDJOPASJDPOJASPDAAPOSDJPODSPJADSPOJODSJPAOAPSODJPOASDJPDJPOADSJPOSPAODSJPJOPASDOPJAPDSJ"),
        //Column( children: orders.map((e) => Text(e.toString())).toList() )    
      ],
      
     ),
    );
  }
}
