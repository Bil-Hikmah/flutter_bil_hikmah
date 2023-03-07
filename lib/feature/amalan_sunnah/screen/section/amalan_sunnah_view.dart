import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/logic/amalan_sunnah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/default_detail/default_detail_page.dart';
import 'package:flutter_bil_hikmah/widget/field/default_card_item.dart';

class AmalanSunnahView extends StatefulWidget {
  const AmalanSunnahView(this.state, {Key? key}) : super(key: key);

  final AmalanSunnahState state;

  @override
  State<AmalanSunnahView> createState() => _AmalanSunnahViewState();
}

class _AmalanSunnahViewState extends State<AmalanSunnahView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: widget.state.amalanSunnahItem.length,
      itemBuilder: (context, index) {
        return defaultItemCard(
          widget.state.amalanSunnahItem[index].title,
          () {
            Navigator.of(context).push(DefaultDetailPage.route(
              widget.state.amalanSunnahItem[index].title,
              widget.state.amalanSunnahItem[index].webURL,
            ));
          },
        );
      },
    );
  }
}
