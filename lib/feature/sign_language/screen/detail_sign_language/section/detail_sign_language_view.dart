import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/list_detail_sign_dummy.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DetailSignLangugeView extends StatefulWidget {
  const DetailSignLangugeView(this.headerTitle, this.dummyData, {Key? key})
      : super(key: key);

  final String headerTitle;
  final DetailSignDummy dummyData;

  @override
  State<DetailSignLangugeView> createState() => _DetailSignLangugeViewState();
}

class _DetailSignLangugeViewState extends State<DetailSignLangugeView> {
  bool _visible = false;
  late Widget _popUpWidget;

  @override
  void initState() {
    _popUpWidget = Container();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _headerSignLanguageDetail() => Container(
          margin: const EdgeInsets.only(
            top: 24.0,
            bottom: 24.0,
          ),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(UrlAsset.signLanguageBanner),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.headerTitle,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textTripleExtraLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

    Widget _signItem(
      String urlImage,
      String title,
    ) =>
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: AppColors.lightGreyLight)),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyMedium,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: Alignment.center,
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
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        );

    Widget _actionPopUpSignLanguage() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.lightGreyLight.withOpacity(0.4),
              ),
              child: const Icon(
                Icons.share_outlined,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Bagikan",
              style: AppTextStyle.textExtraLarge.copyWith(
                color: Colors.white,
              ),
            )
          ],
        );

    Widget _popUpSignLanguage(
      String title,
      String urlImage,
    ) =>
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _visible = false;
                });
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.darkGreyDark.withOpacity(0.75),
                child: null,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  width: 238.0,
                  height: 350.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryLight,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: urlImage,
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
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            title,
                            softWrap: true,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textExtraLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _actionPopUpSignLanguage(),
                      _actionPopUpSignLanguage(),
                      _actionPopUpSignLanguage(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );

    Widget _onGenerateSignItem() => widget.dummyData.detailSignItemData == null
        ? Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Text(
                "Sorry data on progress",
                style: AppTextStyle.textLarge
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 5,
              crossAxisSpacing: 14.0,
              mainAxisSpacing: 14.0,
            ),
            itemCount: widget.dummyData.detailSignItemData?.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  _popUpWidget = _popUpSignLanguage(
                    widget.dummyData.detailSignItemData![index].title,
                    widget.dummyData.detailSignItemData![index].urlImage,
                  );
                  _visible = true;
                });
              },
              child: _signItem(
                widget.dummyData.detailSignItemData![index].urlImage,
                widget.dummyData.detailSignItemData![index].title,
              ),
            ),
          );

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              _headerSignLanguageDetail(),
              _onGenerateSignItem(),
            ],
          ),
        ),
        Visibility(
          visible: _visible,
          child: _popUpWidget,
        )
      ],
    );
  }
}
