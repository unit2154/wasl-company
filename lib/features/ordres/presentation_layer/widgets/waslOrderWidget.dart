import 'package:flutter/material.dart';   

class WaslOrderWidget extends StatelessWidget {
  final String orderStatus;
  final String orderDate;
  final String orderPrice;
  const WaslOrderWidget({
    super.key,
    required this.orderStatus,
    required this.orderDate,
    required this.orderPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.offline_bolt_sharp,
                    color: orderStatus == "تامة"
                        ? Colors.green
                        : orderStatus == "قيد التجهيز"
                            ? Colors.orange
                            : Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(orderStatus),
                  Spacer(),
                  Text(orderDate),
                  SizedBox(width: 5),
                  Icon(Icons.date_range_sharp, color: Colors.blue),
                ],
              ),
              Container(
                width: double.infinity /2,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: orderStatus == "تامة" ? Colors.green : orderStatus == "قيد التجهيز" ? Colors.orange : Colors.red,
                ),
                margin: EdgeInsets.symmetric(vertical: 5),
                
              ),
            ],
          ),
          subtitle: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset(
                        "assets/images/item.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "معكرونة التونسا (كيس صغير)",
                          style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 16,
                            ),
                            Text(
                              "شركة الودق/جميلة",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF646464),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("السعر الكلي", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                  Spacer(),
                  Text("IQD ", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                  Text(orderPrice, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
