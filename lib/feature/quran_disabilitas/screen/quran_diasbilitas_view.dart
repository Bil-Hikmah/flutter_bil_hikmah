import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/helper/string_helper.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/logic/cubit/quran_disbailitas_cubit.dart';
import 'package:flutter_bil_hikmah/style/shadow.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

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
        height: 30.0,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          image: DecorationImage(
            image: NetworkImage(videoUrl.getVideoThumbnail),
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
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: AppShadow.cardShadowDarkGreyLight,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppTextMediumPrimary(surahName),
              ),
              traillingBanner(videoURL),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.state.quranDisabilitas.length,
      itemBuilder: (context, index) {
        return listQuranDiabilityContainer(
          widget.state.quranDisabilitas[index].surahName,
          widget.state.quranDisabilitas[index].videoURL,
          ((videoURL) {}),
        );
      },
    );
  }
}
