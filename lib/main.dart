import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/provider/app_bloc_provider.dart';
import 'package:flutter_bil_hikmah/config/routes/route_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' as dart_io;

class MyHttpOverrides extends dart_io.HttpOverrides {
  @override
  dart_io.HttpClient createHttpClient(dart_io.SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (dart_io.X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dart_io.HttpOverrides.global = MyHttpOverrides();
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
