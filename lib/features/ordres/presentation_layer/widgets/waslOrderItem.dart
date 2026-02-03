import 'package:flutter/material.dart';

class WaslOrderItem extends StatelessWidget {
  const WaslOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2))),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.164,
            height: MediaQuery.of(context).size.width * 0.164,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: const Color(0xEEE3E7EC)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Image.asset("assets/images/item.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            child: Column(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بيبسي كولا (كارتون ',
                  style: TextStyle(
                    color: const Color(0xFF282828),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'شركة الودق\جميلة',
                  style: TextStyle(
                    color: const Color(0xFF646464),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
