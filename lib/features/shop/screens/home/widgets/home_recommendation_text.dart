import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/search_products/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: SectionHeading(
        title: 'Rekomendasi',
        showActionButton: true,
        textColor: Colors.black,
        buttonTittle: 'Lihat Semua',
        onPressed: () {
          Get.to(() => SearchProductScreen());
        },
      ),
    );
  }
}
