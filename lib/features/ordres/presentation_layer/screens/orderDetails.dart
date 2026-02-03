import 'package:flutter/material.dart';
import 'package:wasl/widgets/waslOrderItem.dart';

class Orderdetails extends StatefulWidget {
  const Orderdetails({super.key});

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  int reason = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("تفاصيل الطلب"),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          body: Center(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width * .876,
                  height: MediaQuery.of(context).size.height * .398,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: const Color(0xEEE3E7EC),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .0947,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: const Color(0xEEE3E7EC),))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12*(MediaQuery.of(context).size.width/390)),
                          child: Row(
                            spacing: 10,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width*.102,
                                  height: MediaQuery.of(context).size.width*.102,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/pepsi_logo.png"),
                                        fit: BoxFit.cover
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x28000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  )
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.65,
                                height: MediaQuery.of(context).size.width*.102,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('شركة بيبسي',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF282828),
                                        fontSize: 14*(MediaQuery.of(context).size.height/844),
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    Text('رمز الطلب : 12345566',
                                      style: TextStyle(
                                        color: const Color(0xFF646464),
                                        fontSize: 12*(MediaQuery.of(context).size.height/844),
                                        fontWeight: FontWeight.w400,
                                      ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .0758,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: const Color(0xEEE3E7EC),))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16*(MediaQuery.of(context).size.width/390)),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.calendar_today_outlined),
                              Text('الثلاثاء, مارس ',
                                style: TextStyle(
                                  color: const Color(0xFF646464),
                                  fontSize: 14*(MediaQuery.of(context).size.width/390),
                                  fontWeight: FontWeight.w400,
                                ),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .0758,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: const Color(0xEEE3E7EC),))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16*(MediaQuery.of(context).size.width/390)),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text('زيونة/خدمي دريم ستي/اسواق زينيا',
                                style: TextStyle(
                                  color: const Color(0xFF646464),
                                  fontSize: 14*(MediaQuery.of(context).size.width/390),
                                  fontWeight: FontWeight.w400,
                                ),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*.147,
                        child: Column(
                          spacing: 12*(MediaQuery.of(context).size.height/844),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              spacing: 14*(MediaQuery.of(context).size.width/390),
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 148*(MediaQuery.of(context).size.width/390),
                                  height: 36*(MediaQuery.of(context).size.height/844),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF000A5A),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    spacing: 10,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.refresh, color: Colors.white,),
                                      Text(
                                        'اطلب مجددا',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14*(MediaQuery.of(context).size.width/390),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 148*(MediaQuery.of(context).size.width/390),
                                  height: 36*(MediaQuery.of(context).size.height/844),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF000A5A),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    spacing: 10,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.wifi_calling_3_outlined,color: Colors.white,),
                                      Text(
                                        'الدعم والتواصل',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14*(MediaQuery.of(context).size.width/390),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                showDialog(context: context, builder: (context)=>Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AlertDialog(
                                    title: Text("سبب الالغاء"),
                                    content: StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width*.75,
                                          height: MediaQuery.of(context).size.width*.6,
                                          child: Column(
                                            children: [
                                              RadioMenuButton(value: 0, groupValue: reason, onChanged: (v){setState(() {reason=v!; print(reason);});}, child: Text("data")),
                                              RadioMenuButton(value: 1, groupValue: reason, onChanged: (v){setState(() {reason=v!; print(reason);});}, child: Text("data")),
                                              RadioMenuButton(value: 2, groupValue: reason, onChanged: (v){setState(() {reason=v!; print(reason);});}, child: Text("data")),
                                              RadioMenuButton(value: 3, groupValue: reason, onChanged: (v){setState(() {reason=v!; print(reason);});}, child: Text("data")),
                                              SizedBox(height: 10,),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: 310*(MediaQuery.of(context).size.width/390),
                                                  height: 36*(MediaQuery.of(context).size.height/844),
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFEFEFE),
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        color: const Color(0xFFFF0000),
                                                      ),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    shadows: [
                                                      BoxShadow(
                                                        color: Color(0x1E000000),
                                                        blurRadius: 4,
                                                        offset: Offset(0, 1),
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(
                                                    spacing: 10,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.cancel_outlined, color:  const Color(0xFFFF0000),),
                                                      Text(
                                                        'الغاء الطلب',
                                                        style: TextStyle(
                                                          color: const Color(0xFFFF0000),
                                                          fontSize: 14*(MediaQuery.of(context).size.width/390),
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ));
                              },
                              child: Container(
                                width: 310*(MediaQuery.of(context).size.width/390),
                                height: 36*(MediaQuery.of(context).size.height/844),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFEFEFE),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: const Color(0xFFFF0000),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x1E000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cancel_outlined, color:  const Color(0xFFFF0000),),
                                    Text(
                                      'الغاء الطلب',
                                      style: TextStyle(
                                        color: const Color(0xFFFF0000),
                                        fontSize: 14*(MediaQuery.of(context).size.width/390),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .876,
                  height: MediaQuery.of(context).size.height * .298,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: const Color(0xEEE3E7EC),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 52*(MediaQuery.of(context).size.height/844),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color:  const Color(0xFFE2E2E2)))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21*(MediaQuery.of(context).size.width/390),
                            vertical: 15*(MediaQuery.of(context).size.height/844)
                          ),
                          child: Text(
                            'طلبك',
                            style: TextStyle(
                              color: const Color(0xFF282828),
                              fontSize: 16*(MediaQuery.of(context).size.height/844),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 195*(MediaQuery.of(context).size.height/844),
                        child: ListView(
                          children: [
                            WaslOrderItem(),
                            WaslOrderItem(),
                            WaslOrderItem(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * .876,
                    height: MediaQuery.of(context).size.height * .06,
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
                          fontSize: 16*(MediaQuery.of(context).size.height/844),
                          fontWeight: FontWeight.w500,
                        )),
                        Spacer(),
                        Text("500,000 IQD", style: TextStyle(
                          color: const Color(0xFF199F59),
                          fontSize: 16*(MediaQuery.of(context).size.height/844),
                          fontWeight: FontWeight.w500,
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
