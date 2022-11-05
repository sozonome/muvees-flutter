import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muvees/core/config/routes/router.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
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
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.outfitTextTheme(textTheme),
      ),
    );
  }
}
