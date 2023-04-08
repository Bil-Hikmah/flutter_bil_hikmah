import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';

import '../../domain/repository/city_adhan_item.dart';

class AdhanBottomSheet extends StatefulWidget {
  const AdhanBottomSheet(this.onAdhanSelected, {Key? key}) : super(key: key);

  final void Function(String adhan) onAdhanSelected;

  @override
  State<AdhanBottomSheet> createState() => _AdhanBottomSheetState();
}

class _AdhanBottomSheetState extends State<AdhanBottomSheet> {
  List<String> cityAdhanItems = cityAdhanItem;
  @override
  Widget build(BuildContext context) {
    Widget listCity() {
      return ListView.builder(
        itemCount: cityAdhanItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cityAdhanItems[index]),
            onTap: () {
              widget.onAdhanSelected(cityAdhanItems[index]);
              Navigator.pop(context);
            },
          );
        },
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 3.0,
            decoration: BoxDecoration(
              color: AppColors.lightGreyMedium,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 24.0),
          const AppTextMediumPrimary("Lokasi Adhan").copyWith(
            style:
                AppTextStyle.textMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          DefaultTextField(
            hintText: "Cari lokasi ...",
            suffixWidget: const Icon(Icons.search),
            onChanged: (String? value) {
              if (value?.isNotEmpty ?? false) {
                cityAdhanItems = cityAdhanItem
                    .where((element) =>
                        element.toLowerCase().contains(value!.toLowerCase()))
                    .toList();
                setState(() {});
              } else {
                cityAdhanItems = cityAdhanItem;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(child: listCity()),
        ],
      ),
    );
  }
}
