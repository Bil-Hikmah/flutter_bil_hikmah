import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/common/helper/string_helper.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem(
    this.url,
    this.title,
    this.type,
    this.countView,
    this.date, {
    Key? key,
  }) : super(key: key);

  final String url;
  final String title;
  final String type;
  final int countView;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final _itemImage = Container(
      margin: const EdgeInsets.only(right: 12.0),
      width: 125.0,
      height: 95.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.secondaryLight,
        // image: DecorationImage(
        //   image: AssetImage(url),
        //   fit: BoxFit.cover,
        // ),
      ),
    );

    final _descriptionItem = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Melangkah Menuju Hidup Islami yang Berseri Menyakan asdnononqonrq fnoqno",
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textSmall.copyWith(
            color: AppColors.darkGreyDark,
          ),
        ),
        Text(
          type,
          style: AppTextStyle.textSmall.copyWith(
            color: AppColors.darkGreyLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Text(
              "${countView.formatNumber} Views",
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.darkGreyDark,
              ),
            ),
            const SizedBox(width: 8.0),
            const Icon(
              Icons.circle,
              color: AppColors.darkGreyLight,
              size: 2.0,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                date.formatDate,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        ),
      ],
    );

    // Main of View
    return Row(
      children: [
        _itemImage,
        Expanded(
          child: _descriptionItem,
        )
      ],
    );
  }
}
