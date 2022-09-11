import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DetailPosterView extends StatefulWidget {
  const DetailPosterView({Key? key}) : super(key: key);

  @override
  State<DetailPosterView> createState() => _DetailPosterViewState();
}

class _DetailPosterViewState extends State<DetailPosterView> {
  @override
  Widget build(BuildContext context) {
    final _image = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.8),
      ),
      child: null,
    );

    final _actionContainer = Column(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: AppColors.lightGreyLight.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 24.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Contoh",
          style: AppTextStyle.textMedium.copyWith(color: Colors.white),
        )
      ],
    );

    final _action = Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _actionContainer,
                _actionContainer,
                _actionContainer,
                _actionContainer,
              ],
            ),
          ],
        ),
      ),
    );

    return Stack(
      children: [
        _image,
        _action,
      ],
    );
  }
}
