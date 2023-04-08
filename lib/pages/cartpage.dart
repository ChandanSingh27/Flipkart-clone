import 'dart:math';

import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flipkartclone/pages/footersection.dart';
import 'package:flipkartclone/provider/searchpageprovider.dart';
import 'package:flipkartclone/widgets/homepagewidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<ProductModel> products = Provider.of<SearchPage>(context)
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        Provider.of<SearchPageProvider>(context).productsCard;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: navBarColor,
          child: customAppBar(context),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            int randomNumber = Random().nextInt(2000) + 100;
            int randomNumberForPercentage = Random().nextInt(70) + 10;
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    // color: Colors.black,
                    width: 300,
                    height: 200,
                    child: Image.network(
                      products[index].itemImageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          products[index].itemName.length > 30
                              ? '${products[index].itemName.substring(0, 30)}...'
                              : products[index].itemName,
                          style: dialogBoxBlackColorTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 29, 181, 35),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(children: [
                            Text(
                              products[index].itemRating,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 15,
                            )
                          ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          products[index].itemDesc.length > 50
                              ? '${products[index].itemDesc.substring(0, 50)}...'
                              : products[index].itemDesc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: bannerItemWidgetsTextStyle,
                        )
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹${products[index].itemPrice.toString()}",
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            '₹ $randomNumber',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            ' $randomNumberForPercentage% off',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Free delivery',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Upto",
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              children: [
                            TextSpan(
                                text: " ₹$randomNumber",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            const TextSpan(text: " Off on Exchange")
                          ])),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Bank Offer',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<SearchPageProvider>(context,
                                  listen: false)
                              .removeFromCard(products[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "REMOVE",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        )),
        footer(context)
      ]),
    );
  }
}
