import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'mainApp/blocs/fetch_contents_bloc.dart';
import 'mainApp/blocs/fetch_sections_bloc.dart';
import 'mainApp/reusables/colors.dart';
import 'mainApp/main_app_view.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    if (kDebugMode) debugPrint("[App Zone Error ]>>  $error \n[App Zone Stacktrace]: $stack");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchSectionsBloc()),
        BlocProvider(create: (context) => FetchContentsBloc()),
      ],
      child: MaterialApp(
        title: 'My Deals Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainAppView(),
      ),
    );
  }
}
