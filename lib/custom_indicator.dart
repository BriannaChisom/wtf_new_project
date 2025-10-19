import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.indicatorCount,
    required this.activeIndex,
  });
  final int indicatorCount;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        indicatorCount,
        (index) =>
            //Expanded(child:
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 4),
              //width: activeIndex == index ? 50 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeIndex == index
                    ? Colors.blue
                    : Colors.blue.shade300,
                //borderRadius: BorderRadius.circular(20)
              ),
              height: 10,
              width: 10,
              // ),
            ),
      ),
    );
  }
}
