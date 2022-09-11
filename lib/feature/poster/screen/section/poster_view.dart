import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/domain/model/poster_genre.dart';
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

    final _poster = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.primaryDark,
      ),
      child: null,
    );

    final _listPoster = GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(DetailPosterPage.route());
          },
          child: _poster,
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
