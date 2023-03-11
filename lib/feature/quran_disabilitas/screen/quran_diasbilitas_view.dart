import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/helper/string_helper.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/logic/cubit/quran_disbailitas_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/shadow.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

import 'quran_disbailitas_detail/quran_disabilitas_detail_page.dart';

typedef OnTapQuranDisabilitasCard = void Function(String videoURL);

class QuranDisabilitasView extends StatefulWidget {
  const QuranDisabilitasView(this.state, {Key? key}) : super(key: key);

  final QuranDisbailitasState state;

  @override
  State<QuranDisabilitasView> createState() => _QuranDisabilitasViewState();
}

class _QuranDisabilitasViewState extends State<QuranDisabilitasView> {
  @override
  Widget build(BuildContext context) {
    Widget traillingBanner(String videoUrl) {
      return Container(
        height: 35.0,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          image: DecorationImage(
            image: NetworkImage(
              videoUrl.substring(videoUrl.length - 11).getVideoThumbnail,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget listQuranDiabilityContainer(
      String surahName,
      String videoURL,
      OnTapQuranDisabilitasCard onTap,
    ) {
      return InkWell(
        onTap: () {
          onTap(videoURL);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: AppShadow.card1,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppTextMediumPrimary(surahName),
              ),
              traillingBanner(videoURL),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkGreyLightest,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: widget.state.quranDisabilitas.length,
      itemBuilder: (context, index) {
        return listQuranDiabilityContainer(
          widget.state.quranDisabilitas[index].surahName,
          widget.state.quranDisabilitas[index].videoURL,
          ((videoURL) {
            Navigator.of(context)
                .push(QuranDisabilitasDetailPage.route(videoURL));
          }),
        );
      },
    );
  }
}
