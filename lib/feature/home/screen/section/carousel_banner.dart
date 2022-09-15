import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({
    Key? key,
  }) : super(key: key);

  @override
  _CarouselBannerState createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CarouselSlider(
            items: List.generate(
              4,
              (index) => SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://www.berbaginews.com/wp-content/uploads/2021/12/266728609_275756271250676_6902856754927474768_n.jpg",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 5),
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: _current == index ? 12.0 : 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                      vertical: 1.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          _current == index ? BorderRadius.circular(9.0) : null,
                      shape: _current == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      color: _current == index
                          ? AppColors.primaryDark
                          : AppColors.lightGreyDark,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
