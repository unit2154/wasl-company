import 'package:flutter/material.dart';

class WaslOrderCard extends StatelessWidget {
  int state;
  String image;

  WaslOrderCard({super.key, required this.state, required this.image});

  @override
  Widget build(BuildContext context) {
    var color, bcolor, btext;
    state == 0
        ? color = Color(0xFFFF0000)
        : state == 1
        ? color = Color(0xFFE86F00)
        : color = Color(0xFF199F59);
    state == 0
        ? bcolor = Color(0x19FF0000)
        : state == 1
        ? bcolor = Color(0x19E86F00)
        : bcolor = Color(0x19199F59);
    state == 0
        ? btext = "تم الرفض"
        : state == 1
        ? btext = "قيد المراجعة"
        : btext = "تمت الموافقة";

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Orderdetails()),
        );
      },
      child: Column(
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.22,
            decoration: ShapeDecoration(
              color: const Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: const Color(0xFFE2E2E2)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: width * 0.285,
                      height: height * 0.038,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: bcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: color,
                              size: width * .02,
                            ),
                            Text(
                              btext,
                              style: TextStyle(
                                color: color,
                                fontSize:
                                    12 *
                                    (MediaQuery.of(context).size.height / 844),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .011,
                    left: 0,
                    child: Text(
                      "الثلاثاء, مارس 18, 12:38 م",
                      style: TextStyle(
                        color: const Color(0xFF646464),
                        fontSize:
                            14 * (MediaQuery.of(context).size.height / 844),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .052,
                    child: Container(
                      width: width * .89,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFE2E2E2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .066,
                    right: 0,
                    child: Container(
                      width: width * .102,
                      height: width * .102,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: width * .123,
                    top: height * .068,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'شركة بيبسي',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF282828),
                            fontSize:
                                14 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'رمز الطلب : ',
                          style: TextStyle(
                            color: const Color(0xFF646464),
                            fontSize:
                                12 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height * .137,
                    right: 0,
                    child: Row(
                      children: [
                        Container(
                          width: width * .051,
                          height: width * .051,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/coins.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "السعر الكلي",
                          style: TextStyle(
                            color: const Color(0xFF282828),
                            fontSize:
                                14 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "12345",
                          style: TextStyle(
                            color: const Color(0xFF282828),
                            fontSize:
                                14 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          " IQD ",
                          style: TextStyle(
                            color: const Color(0xFF282828),
                            fontSize:
                                14 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        print("done");
                      },
                      child: Container(
                        width: width * .235,
                        height: height * .066,
                        decoration: ShapeDecoration(
                          color: state == 2
                              ? Color(0xFF000A5A)
                              : Color(0xFFD4D4D4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            spacing: 3,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner_sharp,
                                color: Colors.white,
                              ),
                              Text(
                                "اتمام الطلب",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
