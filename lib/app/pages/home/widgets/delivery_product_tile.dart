import 'package:delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  const DeliveryProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.percentHeight(.008)),
                  child: Text(
                    product.name,
                    style: context.textStyles.textExtraBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: context.percentHeight(.008)),
                  child: Text(
                    product.description,
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: context.percentHeight(.008)),
                  child: Text(
                    product.price.currencyPTBR,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 11,
                      color: ColorsApp.i.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.git',
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
