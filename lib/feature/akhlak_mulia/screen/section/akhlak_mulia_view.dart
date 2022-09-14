import 'package:flutter/material.dart';

import 'package:flutter_bil_hikmah/widget/field/default_card_item.dart';

class AkhlakMuliaView extends StatefulWidget {
  const AkhlakMuliaView({Key? key}) : super(key: key);

  @override
  State<AkhlakMuliaView> createState() => _AkhlakMuliaViewState();
}

class _AkhlakMuliaViewState extends State<AkhlakMuliaView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: defaultItemCard("Akhlak Mulia", () {}),
              )
            : defaultItemCard("Akhlak Mulia", () {});
      },
    );
  }
}
