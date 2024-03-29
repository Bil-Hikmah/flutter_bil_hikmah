import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/section/pop_up_sign.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DetailSignLangugeView extends StatefulWidget {
  const DetailSignLangugeView(this.headerTitle, this.data, {Key? key})
      : super(key: key);

  final String headerTitle;
  final List<SignLanguageDetail> data;

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
              CachedNetworkImage(
                imageUrl: urlImage,
                imageBuilder: (context, imageProvider) => Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.lightGreyMedium,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: AppColors.primaryDark,
                  ),
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

    Widget _onGenerateSignItem() => widget.data.isEmpty
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
            itemCount: widget.data.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  _popUpWidget = PopUpSign(
                    widget.data[index].title,
                    widget.data[index].imageURL,
                    () {
                      setState(() {
                        _visible = false;
                      });
                    },
                  );
                  _visible = true;
                });
              },
              child: _signItem(
                widget.data[index].imageURL,
                widget.data[index].title,
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
