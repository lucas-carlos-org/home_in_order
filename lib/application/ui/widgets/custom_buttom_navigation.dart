import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key? key,
    required this.itemIcons,
    required this.centerIcon,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = const Color(0xff46BDFA),
    this.selectedLightColor = const Color(0xff77E2FE),
    this.unselectedColor = const Color(0xffB5C8E7),
  })  : assert(itemIcons.length == 4 || itemIcons.length == 2, 'Item must equal 4 or 2'),
        super(key: key);

  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    final height = this.height ?? getRelativeHeight(0.076);

    return SizedBox(
      height: height + getRelativeHeight(0.025),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getRelativeWidth(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment:
                              itemIcons.length == 4 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(0);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Icon(
                                    itemIcons[0],
                                    color: selectedIndex == 0 ? selectedColor : unselectedColor,
                                    size: getRelativeWidth(0.05),
                                  ),
                                ),
                              ),
                            ),
                            if (itemIcons.length == 4)
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  customBorder: const CircleBorder(),
                                  splashColor: selectedColor.withOpacity(0.5),
                                  onTap: () {
                                    onItemPressed(1);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Icon(
                                      itemIcons[1],
                                      size: 16,
                                      color: selectedIndex == 1 ? selectedColor : unselectedColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 3),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment:
                              itemIcons.length == 4 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(itemIcons.length == 4 ? 3 : 2);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Icon(
                                    itemIcons[itemIcons.length == 4 ? 2 : 1],
                                    size: 16,
                                    color: selectedIndex == (itemIcons.length == 4 ? 3 : 2)
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                ),
                              ),
                            ),
                            if (itemIcons.length == 4)
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  customBorder: const CircleBorder(),
                                  splashColor: selectedColor.withOpacity(0.5),
                                  onTap: () {
                                    onItemPressed(4);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Icon(
                                      itemIcons[3],
                                      size: 16,
                                      color: selectedIndex == 4 ? selectedColor : unselectedColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      onItemPressed(itemIcons.length == 4 ? 2 : 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            offset: const Offset(0, 5),
                            color: selectedColor.withOpacity(0.75),
                          )
                        ],
                        borderRadius: const BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            selectedLightColor,
                            selectedColor,
                          ],
                        ),
                      ),
                      height: getRelativeWidth(0.135),
                      width: getRelativeWidth(0.135),
                      child: Center(
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Icon(
                            centerIcon,
                            color: Colors.white,
                            size: getRelativeWidth(0.07),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void initSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}

double getRelativeHeight(double percentage) {
  return percentage * SizeConfig.screenHeight;
}

double getRelativeWidth(double percentage) {
  return percentage * SizeConfig.screenWidth;
}
