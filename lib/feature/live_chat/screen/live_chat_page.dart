import 'package:crisp/crisp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveChatPage extends StatefulWidget {
  const LiveChatPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const LiveChatPage(),
      );

  @override
  State<LiveChatPage> createState() => _LiveChatPageState();
}

class _LiveChatPageState extends State<LiveChatPage> {
  final String crispWebstiteID = "2fbda484-e7e3-4ac5-8a1a-b92173296500";

  late CrispMain crispMain;

  @override
  void initState() {
    super.initState();

    crispMain = CrispMain(
      websiteId: crispWebstiteID,
      locale: 'en-us',
    );

    crispMain.register(
      user: CrispUser(
        email:
            BlocProvider.of<AuthenticationCubit>(context).state.user?.email ??
                "Unknown Email",
        nickname: BlocProvider.of<AuthenticationCubit>(context)
                .state
                .user
                ?.displayName ??
            "Unknown Name",
        phone: BlocProvider.of<AuthenticationCubit>(context)
                .state
                .user
                ?.phoneNumber ??
            "089xxxx-Unknown Phone",
      ),
    );

    crispMain.setMessage("Hallo admin, mau tanya dong");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Live Chat",
      ),
      body: CrispView(
        crispMain: crispMain,
        clearCache: false,
      ),
    );
  }
}
