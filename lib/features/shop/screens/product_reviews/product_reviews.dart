import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/products/ratings/rating_indicator.dart';
import 'package:bliguh/features/shop/screens/product_reviews/widgets/overall_product_ratings.dart';
import 'package:bliguh/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Reviews & Ratings'),
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and reviews are verified and are from people she use the same type of device thtat you use.'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Product Ratings
              OverallProductRating(),
              TRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                "12.611",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///User Reviews List
              UserReviewCard(
                nameReviewer: 'Clarisa ',
                imageReviewer: TImages.userProfileImage1,
                dateReviewer: '01 Nov 2023',
                isReplyStore: true,
              ),
              UserReviewCard(
                nameReviewer: 'John Doe ',
                imageReviewer: TImages.userProfileImage2,
                dateReviewer: '03 Nov 2023 ',
              ),
              UserReviewCard(
                nameReviewer: 'Clarisa ',
                imageReviewer: TImages.userProfileImage3,
                dateReviewer: '05 Nov 2023',
                isReplyStore: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
