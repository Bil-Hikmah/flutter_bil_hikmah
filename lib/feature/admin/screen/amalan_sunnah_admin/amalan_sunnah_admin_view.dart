import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/admin/logic/admin_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class AmalanSunnahAdminView extends StatefulWidget {
  const AmalanSunnahAdminView({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const AmalanSunnahAdminView(),
      );

  @override
  State<AmalanSunnahAdminView> createState() => _AmalanSunnahAdminViewState();
}

class _AmalanSunnahAdminViewState extends State<AmalanSunnahAdminView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state.status == AdminStatus.loading) {
            ProgressHUD.of(context)?.showWithText("Loading");
          } else {
            ProgressHUD.of(context)?.dismiss();
          }
          if (state.status == AdminStatus.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil menambahkan amalan sunnah"),
                backgroundColor: AppColors.primaryDark,
              ),
            );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: "Amalan Sunnah",
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  DefaultTextField(
                    hintText: "Masukan Judul",
                    controller: _titleController,
                    labelText: "Judul",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Judul tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  DefaultTextField(
                    hintText: "Masukan Link",
                    controller: _linkController,
                    labelText: "Link",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Link tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ButtonDefault(
                    text: "Simpan",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AdminCubit>().onAddAmalanSunnahItem(
                              _titleController.text,
                              _linkController.text,
                            );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
