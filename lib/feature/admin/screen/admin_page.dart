import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/admin/logic/admin_cubit.dart';
import 'package:flutter_bil_hikmah/feature/admin/repository/admin_repository.dart';
import 'package:flutter_bil_hikmah/feature/admin/screen/admin_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const AdminPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit(AdminRepositoryImpl()),
      child: Scaffold(
        appBar: defaultAppBar(
          context: context,
          title: "Admin",
        ),
        body: const AdminView(),
      ),
    );
  }
}
