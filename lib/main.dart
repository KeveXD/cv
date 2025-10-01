import 'package:cv/ui/cv_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/language_cubit.dart';

void main() {
  runApp(const CvApp());
}

// A main.dart fájl által hívott fő widget
class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    // A Cubit-ot a MaterialApp gyökérszintjén biztosítjuk az alkalmazás számára
    return BlocProvider(
      create: (_) => LanguageCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Balla Keve - CV',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        home: const CvScreen(),
      ),
    );
  }
}