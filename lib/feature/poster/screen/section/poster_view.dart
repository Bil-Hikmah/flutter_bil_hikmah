import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_genre_dummy.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_item_dummy.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/detail_poster/detail_poster_page.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/section/poster_genre_item.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

class PosterView extends StatefulWidget {
  const PosterView({Key? key}) : super(key: key);

  @override
  State<PosterView> createState() => _PosterViewState();
}

class _PosterViewState extends State<PosterView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _buildGenrePoster = SizedBox(
      height: 46.0,
      child: PosterGenreItem(
        _currentIndex,
        listPosterGenre,
        (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );

    Widget _poster(String urlImage) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.black.withOpacity(0.1),
          ),
          child: CachedNetworkImage(
            imageUrl: urlImage,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
                color: AppColors.primaryDark,
              ),
            ),
            fit: BoxFit.cover,
          ),
        );

    final _listPoster = GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 3 / 4,
      ),
      itemCount: posterItemDummy.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context)
                .push(DetailPosterPage.route(posterItemDummy[index].urlImage));
          },
          child: _poster(posterItemDummy[index].urlImage),
        );
      },
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGenrePoster,
          const SizedBox(height: 18.0),
          _listPoster,
        ],
      ),
    );
  }
}
