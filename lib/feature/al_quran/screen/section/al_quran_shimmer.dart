import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

class AlquranShimmer extends StatelessWidget {
  const AlquranShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _banner = Container(
      height: 131.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryDark,
      ),
    );

    final _listSurah = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          height: 97.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primaryDark,
          ),
        );
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _banner,
          const SizedBox(height: 16.0),
          _listSurah,
        ],
      ),
    );
  }
}
