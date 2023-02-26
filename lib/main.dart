import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/provider/app_bloc_provider.dart';
import 'package:flutter_bil_hikmah/config/routes/route_handler.dart';
import 'package:flutter_bil_hikmah/config/routes/route_name.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/firebase_options.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  dart_io.HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.providerList,
      child: MaterialApp(
        title: "BilHikmah",
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteHandler.initialRoute,
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        builder: (contextMain, child) {
          return BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: ((contet, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushNamedAndRemoveUntil(
                      Routes.dashboard, (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushNamedAndRemoveUntil(
                      Routes.onboarding, (route) => false);
                  break;
                case AuthenticationStatus.unknown:
                  _navigator.pushNamedAndRemoveUntil(
                      Routes.onboarding, (route) => false);
                  break;
                default:
              }
            }),
            child: child,
          );
        },
      ),
    );
  }
}
