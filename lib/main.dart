import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loggy/loggy.dart';
import 'package:muvees/core/config/routes/router.dart';

Future<void> main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  Loggy.initLoggy(
    logPrinter: StreamPrinter(
      const PrettyDeveloperPrinter(),
    ),
  );

  // Lock Orientation to Portrait only
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      title: 'muvees',
      routerConfig: AppRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.outfitTextTheme(textTheme),
      ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   primarySwatch: Colors.teal,
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.black,
      //   appBarTheme: AppBarTheme(
      //     color: Colors.teal.shade900,
      //   ),
      //   textTheme: GoogleFonts.outfitTextTheme(textTheme),
      // ),
    );
  }
}
