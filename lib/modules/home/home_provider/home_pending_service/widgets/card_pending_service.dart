import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:home_in_order/application/ui/utils/extensions/size_screen_extension.dart';

class CardPendingService extends StatelessWidget {
  const CardPendingService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 71.h,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage:
                          const NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Colors.transparent,
                    ),
                    AvatarGlow(
                      endRadius: 10.r,
                      glowColor: Colors.orange,
                      child: Material(
                          shape: const CircleBorder(),
                          child: Container(
                            height: 15.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 218, 103, 10),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Andrea C.',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Troca de encanamento',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: 66.w,
              height: 23.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.r),
                color: const Color(0xff1976D2),
              ),
              child: Center(
                child: Text(
                  'Detalhes',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
