import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/provider/app_bloc_provider.dart';
import 'package:flutter_bil_hikmah/config/routes/route_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.providerList,
      child: MaterialApp(
        title: "BilHikmah",
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteHandler.initialRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
