import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/dakwah_disabilitas/logic/dakwah_disabilitas_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DawahDisabilitasView extends StatefulWidget {
  const DawahDisabilitasView({
    Key? key,
  }) : super(key: key);

  @override
  State<DawahDisabilitasView> createState() => _DawahDisabilitasViewState();
}

class _DawahDisabilitasViewState extends State<DawahDisabilitasView> {
  @override
  Widget build(BuildContext context) {
    Widget _buildListVideo(List<VideoDakwahModels> data) => ListVideoItem(
          data,
          (VideoDakwahModels item) {
            // Todo : open video detail
            Navigator.of(context).push(VideoDakwahDetailPage.route(
              item.videoURL,
              item,
              data,
            ));
          },
        );

    return BlocBuilder<DakwahDisabilitasCubit, DakwahDisabilitasState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              _buildListVideo(state.videoDakwahItem!),
            ],
          ),
        );
      },
    );
  }
}
