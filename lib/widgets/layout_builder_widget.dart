import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final bool? isColor;
  final int section;
  final double width;
  const AppLayoutBuilderWidget({Key? key, this.isColor, required this.section, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getHeight(24),
      child: LayoutBuilder(
        builder: (BuildContext context,
            BoxConstraints constraints) {
          // print("The width is ${constraints.constrainWidth()}");
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                (constraints.constrainWidth() / section).floor(),
                    (index) => SizedBox(
                  width: width,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.white
                            : Colors.grey.shade300),
                  ),
                )),
          );
        },
      ),
    );
  }
}
