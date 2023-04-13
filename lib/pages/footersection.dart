import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/responsive.dart';
import 'package:flutter/material.dart';

String mainDetails =
    "Flipkart Internet Private Limited,\nBuildings Alyssa, Begonia &\nClove Embassy Tech Village,\nOuter Ring Road, Devarabeesanahalli Village,\nBengaluru, 560103,\nKarnataka, India";

String resigterdOfficeDetails =
    "Flipkart Internet Private Limited,\nBuildings Alyssa, Begonia &\n Clove Embassy Tech Village,\nOuter Ring Road, Devarabeesanahalli Village,\nBengaluru, 560103,\nKarnataka, India\nCIN : U51109KA2012PTC066107\nTelephone: 044-45614700";

//footer code here
Widget footer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 300,
    color: footerColor,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  aboutSection(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  helpSection(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  consumerPolicySection(),
                  if (!Responsive.isMoblie(context))
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                  if (!Responsive.isMoblie(context)) socialSection()
                ],
              ),
              if (!Responsive.isMoblie(context))
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                      child: VerticalDivider(
                        color: Colors.white,
                        width: 0.1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    mailSection(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    registeredOfficeSection()
                  ],
                ),
            ]),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.white,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  footerIconText(Icons.badge_sharp, "Become a Seller"),
                  footerIconText(Icons.star_border_rounded, "Avertise"),
                  footerIconText(Icons.card_giftcard, "Gift Cards"),
                  footerIconText(Icons.help_center, "Help Center"),
                  if (!Responsive.isMoblie(context))
                    footerIconText(Icons.copyright, "2007-2023 Flipkart.com"),
                  if (!Responsive.isMoblie(context))
                    Image.asset(
                      "assets/images/footerlogo.jpg",
                      width: 300,
                      height: 70,
                    )
                ],
              ),
            )
          ]),
    ),
  );
}

Column aboutSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "ABOUT",
        style: footerHeadingItemStyle,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Contact us",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "About us",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Careers",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Flipcart Stories",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Press",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Flipkart Wholesale",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Corporate Infomation",
        style: footerItemStyle,
      ),
    ],
  );
}

//help section
Column helpSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "HELP",
        style: footerHeadingItemStyle,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Payments",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Shipping",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Cancellation & Returns",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "FAQ",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Report Infringement",
        style: footerItemStyle,
      ),
    ],
  );
}

//CONSUMER POLICY
Column consumerPolicySection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "CONSUMER POLICY",
        style: footerHeadingItemStyle,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Return Policy",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Term Of use",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Security",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Privacy",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Sitemap",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Grievance Redressal",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "EPR Companlice",
        style: footerItemStyle,
      ),
    ],
  );
}

//social
Column socialSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "SOCIAL",
        style: footerHeadingItemStyle,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Facebook",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Twitter",
        style: footerItemStyle,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "YouTube",
        style: footerItemStyle,
      ),
    ],
  );
}

//mailSection
Column mailSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Mail Us:",
        style: footerHeadingItemStyle,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        mainDetails,
        style: footerItemStyle,
      ),
    ],
  );
}

// registeredOfficeDetails
Column registeredOfficeSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Registered Office Address::",
        style: footerHeadingItemStyle,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        resigterdOfficeDetails,
        style: footerItemStyle,
      ),
    ],
  );
}

Widget footerIconText(IconData icons, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        icons,
        color: Colors.amber,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
