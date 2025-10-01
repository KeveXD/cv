import 'package:cv/ui/widgets/cv_main_content.dart';
import 'package:cv/ui/widgets/cv_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/language_cubit.dart';
import '../styles.dart';


class CvScreen extends StatelessWidget {
  const CvScreen({super.key});

  // A reszponzivitás határa
  static const double breakpoint = 850.0;

  @override
  Widget build(BuildContext context) {
    // Figyeli a Cubit állapotát a gomb szövegéhez
    final isEnglish = context.watch<LanguageCubit>().state;
    final cubit = context.read<LanguageCubit>();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < breakpoint;

    // Mobil nézetben a CV szélessége 95%, asztali nézetben max 800px
    final cvWidth = isMobile ? screenWidth * 0.95 : 800.0;

    // Fő tartalom (beleértve a címet és az egész CV-t)
    final cvContent = Container(
      width: cvWidth,
      constraints: const BoxConstraints(minHeight: 1120),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: isMobile
          ? const CvMainContent() // Mobil: Csak a fő tartalom (sidebar a drawerben)
          : const Row( // Asztali: Két oszlop
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3, // 30%
            child: CvSidebar(),
          ),
          Expanded(
            flex: 7, // 70%
            child: CvMainContent(),
          ),
        ],
      ),
    );

    // Nyelvi váltó gomb (Widget)
    final languageButton = ElevatedButton(
      onPressed: cubit.toggleLanguage,
      style: ElevatedButton.styleFrom(
        backgroundColor: sidebarBgColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      ),
      child: Text(
        isEnglish ? 'Magyar / English' : 'English / Magyar',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    // --- Asztali vagy mobil nézet renderelése ---

    if (!isMobile) {
      // 1. ASZTALI NÉZET: Stack a gombbal és a középre igazított tartalommal
      return Scaffold(
        backgroundColor: const Color(0xFFf0f0f0),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: cvContent,
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: languageButton,
            ),
          ],
        ),
      );
    } else {
      // 2. MOBIL NÉZET: Scaffold, Drawerrel és AppBarral (Burger menü)
      return Scaffold(
        backgroundColor: const Color(0xFFf0f0f0),
        // Kihúzható bal oldali sáv
        drawer: const Drawer(
          child: CvSidebar(), // A teljes sidebar a drawer tartalma
        ),

        // Appbar a menü gombbal és a gombbal
        appBar: AppBar(
          backgroundColor: sidebarBgColor,
          title: Text(
            isEnglish ? 'Keve Balla CV' : 'Balla Keve Önéletrajza',
            style: const TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: languageButton,
            ),
          ],
        ),

        // Fő tartalom (MainContent) középen
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: cvContent,
          ),
        ),
      );
    }
  }
}