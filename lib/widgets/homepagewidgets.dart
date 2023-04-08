import 'package:flipkartclone/const_value/itemsList.dart';
import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/pages/cartpage.dart';
import 'package:flipkartclone/pages/homepage.dart';
import 'package:flipkartclone/pages/searchpage.dart';
import 'package:flipkartclone/provider/searchpageprovider.dart';
import 'package:flipkartclone/responsive.dart';
import 'package:flipkartclone/widgets/logindialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//search bar code where search bar present in nav bar
Widget searchBar(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: Responsive.isMoblie(context)
        ? MediaQuery.of(context).size.width * 0.50
        : MediaQuery.of(context).size.width * 0.35,
    height: 35,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              controller:
                  Provider.of<SearchPageProvider>(context).searchController,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ));
                }
              },
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration.collapsed(
                  hintText: "Search for products,brands and more"),
            )),

            //search icon button code
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.blue,
                ))
          ]),
    ),
  );
}

//login button
Widget loginButton(BuildContext context) {
  return InkWell(
    onTap: () => loginDialog(context),
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.07,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: const Text(
        "Login",
        style: TextStyle(
            fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w300),
      ),
    ),
  );
}

//nav of the website or app bar
Widget customAppBar(BuildContext context) {
  return Responsive.isMoblie(context)
      ? mobileTabApp(context)
      : desktopApp(context);
}

Row mobileTabApp(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )),
            child: Image.asset(
              "assets/images/flipkartLogo.png",
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
      Row(
        children: [
          searchBar(context),
        ],
      ),
      const SizedBox(
        width: 2,
      )
    ],
  );
}

Row desktopApp(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
        child: Row(children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )),
            child: Image.asset(
              "assets/images/flipkartLogo.png",
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          searchBar(context),
          const SizedBox(
            width: 35,
          ),
          loginButton(context),
          const SizedBox(
            width: 35,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Become a Seller",
                style: navBarItemStyle,
              )),
          const SizedBox(
            width: 35,
          ),
          TextButton(
              onPressed: () {},
              child: const Text("More", style: navBarItemStyle)),
          const SizedBox(
            width: 35,
          ),
          Badge(
            alignment: AlignmentDirectional.topEnd,
            isLabelVisible: true,
            label: Text(Provider.of<SearchPageProvider>(context, listen: false)
                .productsCard
                .length
                .toString()),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    ],
  );
}

//custom items list widgets

Widget customItemsList(BuildContext context) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemCount: itemLists.length,
    itemBuilder: (context, index) {
      return Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(itemLists[index]['imageurl'].toString()),
                radius: 30,
              ),
              Text(itemLists[index]['name'].toString())
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          )
        ],
      );
    },
  );
}
