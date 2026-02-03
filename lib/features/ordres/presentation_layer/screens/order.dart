import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslOrderItem.dart';

import '../widgets/waslButton.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("ملخص الطلب")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("عنوان التوصيل",
                style: TextStyle(
                  color: const Color(0xFF282828),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
              Container(
                height: _height * 0.094,
                width: _width,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: const Color(0xEEE3E7EC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _width * 0.164,
                        height: _width * 0.164,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Image.asset("assets/images/map_small.png"),
                            Center(
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          hint: Text("اختر موقع"),
                          items: [DropdownMenuItem(child: Text("زيونة"))],
                          decoration: InputDecoration(border: InputBorder.none),
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              Text("المشتريات",
                style: TextStyle(
                  color: const Color(0xFF282828),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
              Container(
                width: _width,
                height: _height * 0.457,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: const Color(0xEEE3E7EC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    WaslOrderItem(),
                    WaslOrderItem(),
                    WaslOrderItem(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: _height*0.06,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color(0xFF199F59),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.06,
                          height: MediaQuery.of(context).size.width * 0.06,
                          child: Image.asset("assets/images/coins.png", fit: BoxFit.fill,)
                      ),
                      Text("السعر الكلي", style: TextStyle(
                        color: const Color(0xFF199F59),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                      Spacer(),
                      Text("500,000 IQD", style: TextStyle(
                        color: const Color(0xFF199F59),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))
                    ],
                  ),
                ),
              ),
              WaslButton(text: "اتمام الطلب", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
