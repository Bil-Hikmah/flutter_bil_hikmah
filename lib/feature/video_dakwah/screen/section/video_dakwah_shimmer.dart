import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

class VideoDakwahShimmer extends StatelessWidget {
  const VideoDakwahShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _searchContainer() => Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.primaryDark,
          ),
        );

    Widget _buildGenreVideo() => SizedBox(
          height: 46.0,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return index == 0
                  ? Container(
                      height: 46.0,
                      width: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.primaryDark,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 46.0,
                        width: 65.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.primaryDark,
                        ),
                      ),
                    );
            },
          ),
        );

    Widget _generateVideoDakwah() => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 120.0,
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: const BoxDecoration(
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
          _searchContainer(),
          const SizedBox(height: 12.0),
          _buildGenreVideo(),
          const SizedBox(height: 12.0),
          _generateVideoDakwah(),
        ],
      ),
    );
  }
}
