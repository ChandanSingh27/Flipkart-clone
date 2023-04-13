import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flipkartclone/pages/bookingpage.dart';
import 'package:flipkartclone/pages/searchpage.dart';
import 'package:flipkartclone/responsive.dart';
import 'package:flutter/material.dart';

import '../const_value/textstyle.dart';

// ignore: must_be_immutable
class ItemsBannerWithList extends StatefulWidget {
  List<ProductModel> models;
  String bannerImageUrl;
  String bannerCardDetails;
  ItemsBannerWithList(
      {super.key,
      required this.models,
      required this.bannerImageUrl,
      required this.bannerCardDetails});

  @override
  State<ItemsBannerWithList> createState() => _ItemsBannerWithListState();
}

class _ItemsBannerWithListState extends State<ItemsBannerWithList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Card(
        margin: const EdgeInsets.only(top: 10, bottom: 20, left: 5, right: 5),
        elevation: 10,
        child: Responsive.isMoblie(context)
            ? Row(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: bannerCardWidgets(context, widget.bannerImageUrl,
                        widget.bannerCardDetails, "View All"),
                  ),
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.models.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookingPage(product: widget.models[index]),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: 200,
                            child: bannerItemWidgets(
                                context,
                                widget.models[index].itemImageUrl,
                                widget.models[index].itemName,
                                widget.models[index].itemPrice.toString(),
                                widget.models[index].itemCompanyName),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              )
            : Row(
                children: [
                  bannerCardWidgets(context, widget.bannerImageUrl,
                      widget.bannerCardDetails, "View All"),
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.models.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookingPage(product: widget.models[index]),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: 200,
                            child: bannerItemWidgets(
                                context,
                                widget.models[index].itemImageUrl,
                                widget.models[index].itemName,
                                widget.models[index].itemPrice.toString(),
                                widget.models[index].itemCompanyName),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
      ),
    );
  }
}
// Widget itemsBannerWithList(BuildContext context) {

// }

Stack bannerCardWidgets(BuildContext context, String imageurl,
    String cardDetails, String buttonText) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.network(
        imageurl,
        height: double.infinity,
        fit: BoxFit.cover,
        width: Responsive.isMoblie(context) ? 200 : 300,
      ),
      Container(
        color: Colors.black.withOpacity(0.2),
        width: Responsive.isMoblie(context) ? 200 : 300,
        height: double.infinity,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            cardDetails,
            textAlign: TextAlign.center,
            style: bannerCardStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: navBarColor),
            child: Text(
              buttonText,
              style: bannerCardButtonStyle,
            ),
          )
        ],
      )
    ],
  );
}

Widget bannerItemWidgets(BuildContext context, String imageurl, String itemName,
    String itemPrice, String itemCompanyName) {
  return Column(
    children: [
      const SizedBox(
        height: 4,
      ),
      Image.network(
        imageurl,
        height: 240,
        width: 200,
        // fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        itemName,
        overflow: TextOverflow.ellipsis,
        style: bannerItemWidgetsTextStyle,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        "₹ $itemPrice",
        style: bannerItemWidgetsPriceTextStyle,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        itemCompanyName,
        style: bannerItemWidgetsCompanyTextStyle,
      )
    ],
  );
}
