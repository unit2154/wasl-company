import 'package:flutter/material.dart';
import 'package:wasl/shop/shopProducts.dart';
import 'package:wasl/widgets/waslOrder.dart';

import 'cart.dart';
import 'dashboard.dart';
import 'offers.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  int currentIndex = 0;

  List<Widget> page = [
    Center(child: Text("طلبات"),),
    Center(child: Text("عروض"),),
    Center(child: Text("الرئيسية"),),
    Center(child: Text("البضاعة"),),
    Center(child: Text("السلة"),),
  ];

  @override
  Widget build(BuildContext context) {

    final double swidth = MediaQuery.of(context).size.width;
    final double sheight = MediaQuery.of(context).size.height;

    final double w = swidth/390;
    final double h = sheight/844;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("الطلبات"),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: "الطلبات",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: "العروض",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: "البضاعة",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "السلة",
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                switch (index) {
                  case 0:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
                    break;
                  case 1:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));
                    break;
                  case 2:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    break;
                  case 3:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopProducts()));
                    break;
                  case 4:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                    break;
                }
              });
            },
            selectedItemColor: Color(0xFF000B5B),
            unselectedItemColor: Colors.grey,
          ),

          body: ListView(
            children: [
              Column(
                spacing: 10,
                children: [
                  WaslOrderCard(state: 0, image: "assets/images/pepsi_logo.png",),
                  WaslOrderCard(state: 1, image: "assets/images/pringls_logo.png",),
                  WaslOrderCard(state: 2, image: "assets/images/pepsi_logo.png",),
                ],
              )
            ],
          ),
        )
    );
  }
}
