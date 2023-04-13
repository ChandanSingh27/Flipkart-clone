import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/provider/searchpageprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBox extends StatefulWidget {
  const FilterBox({super.key});

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchPageProvider>(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filters",
            style: dialogBoxBlackColorTextStyle,
          ),
          const Divider(),
          const SizedBox(
            height: 2,
          ),
          const Text("CATEGORIES",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text("Electronics :"),
                Checkbox(
                  value: provider.categoriesElectronics,
                  onChanged: (value) {
                    if (value != null) {
                      if (value) {
                        provider.changeCheckBoxValues(
                            value, "categoriesElectronics");
                      } else {
                        provider.changeCheckBoxValues(
                            value, "categoriesElectronics");
                      }
                    }
                  },
                ),
                const Text("Home & Kitchen :"),
                Checkbox(
                  value: provider.categoriesHomeKitchen,
                  onChanged: (value) {
                    if (value != null) {
                      if (value) {
                        provider.changeCheckBoxValues(
                            value, "categoriesHomeKitchen");
                      } else {
                        provider.changeCheckBoxValues(
                            value, "categoriesHomeKitchen");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          const Text("TYPE :",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 2,
          ),
          Column(
            children: [
              Row(
                children: [
                  const Text("Kitchen :"),
                  Checkbox(
                    value: provider.typeKitchen,
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          provider.changeCheckBoxValues(value, "typeKitchen");
                        } else {
                          provider.changeCheckBoxValues(value, "typeKitchen");
                        }
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Laptop :"),
                  Checkbox(
                    value: provider.typeLaptop,
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          provider.changeCheckBoxValues(value, "typeLaptop");
                        } else {
                          provider.changeCheckBoxValues(value, "typeLaptop");
                        }
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Mobile Phone :"),
                  Checkbox(
                    value: provider.typePhone,
                    onChanged: (value) {
                      if (value != null) {
                        if (value) {
                          provider.changeCheckBoxValues(value, "typePhone");
                        } else {
                          provider.changeCheckBoxValues(value, "typePhone");
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ]);
  }
}
