import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/admin/repository/admin_action.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    Widget _actionItemContainer(
      IconData icon,
      String title,
      void Function() onTap,
    ) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24.0,
                color: AppColors.primaryDark,
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.textMedium.copyWith(
                    color: AppColors.darkGreyDarkest,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 24.0,
                color: AppColors.primaryDark,
              ),
            ],
          ),
        ),
      );
    }

    final _actionItem = List.generate(
      adminAction(context).length,
      (index) {
        return Column(
          children: [
            _actionItemContainer(
              adminAction(context)[index].icon,
              adminAction(context)[index].title,
              adminAction(context)[index].route,
            ),
            const Divider(
              color: AppColors.lightGreyLight,
            )
          ],
        );
      },
    );

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      children: _actionItem,
    );
  }
}
