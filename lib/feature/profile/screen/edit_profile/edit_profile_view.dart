import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/profile/logic/profile_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnSave = void Function(String value);

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  Widget editableItem(
    String title,
    String currentValue,
    OnSave onSave,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.darkGreyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            currentValue,
            textAlign: TextAlign.end,
            style: AppTextStyle.textMedium.copyWith(
              color: AppColors.darkGreyLightest,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
              ),
              builder: (modalContext) {
                return EditableBottomSheet(
                  title,
                  currentValue,
                  onSave,
                );
              },
            );
          },
          child: const Icon(
            Icons.edit,
            color: AppColors.primaryDark,
            size: 16.0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              editableItem(
                "Nama",
                state.user?.displayName ?? "Unknown Display Name",
                (onSaveDisplayName) {
                  int displayLength = onSaveDisplayName.split(" ").length;
                  int wordLength = onSaveDisplayName.length;
                  if (displayLength < 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Nama tidak boleh lebih dari 10 karakter"),
                      ),
                    );
                    return;
                  }
                  if (wordLength < 32) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Nama tidak boleh lebih dari 32 karakter"),
                      ),
                    );
                    return;
                  }
                  context.read<ProfileCubit>().updateDisplayName(
                        onSaveDisplayName,
                        BlocProvider.of<AuthenticationCubit>(context)
                            .state
                            .user
                            ?.id,
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class EditableBottomSheet extends StatefulWidget {
  const EditableBottomSheet(
    this.title,
    this.currentValue,
    this.onSave, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String currentValue;
  final OnSave onSave;

  @override
  State<EditableBottomSheet> createState() => _EditableBottomSheetState();
}

class _EditableBottomSheetState extends State<EditableBottomSheet> {
  final TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textController.text = widget.currentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            Divider(
              color: AppColors.darkGreyLightest,
              thickness: 2.5,
              indent: MediaQuery.of(context).size.width / 2.5,
              endIndent: MediaQuery.of(context).size.width / 2.5,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: DefaultTextField(
                controller: textController,
                hintText: widget.title,
                isNeedAutoFocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${widget.title} tidak boleh kosong";
                  }
                  if (value == widget.currentValue) {
                    return "${widget.title} tidak boleh sama";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ButtonDefault(
              text: "Edit",
              onPressed: () {
                if (!(formKey.currentState?.validate() ?? false)) {
                  return;
                }
                widget.onSave(textController.text);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
