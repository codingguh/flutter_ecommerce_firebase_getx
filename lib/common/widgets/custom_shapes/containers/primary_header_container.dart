import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurveEdgeWidget(
        child: Container(
      color: TColors.primary,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            top: -135,
            right: -150,
            child: CircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 150,
            right: -200,
            child: CircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          child
        ],
      ),
    ));
  }
}
