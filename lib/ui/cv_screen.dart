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

    final cvWidth = isMobile ? screenWidth * 0.95 : 800.0;

    // --- Halvány, nagy háttérkép a CV "papír" aljára ---
    final backgroundDecoration = Positioned(
      bottom: 0,
      right: 0,
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.1,
          child: Image.asset(
            'assets/kalakep.jpg',
            width: isMobile ? 300 : 420.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

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
      child: Stack(
        children: [
          backgroundDecoration,
          isMobile
              ? const CvMainContent()
              : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: CvSidebar(),
              ),
              Expanded(
                flex: 7,
                child: CvMainContent(),
              ),
            ],
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
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Lora', // <-- Itt használjuk az egyik betűtípust (Lora)
        ),
      ),
    );

    // --- Asztali vagy mobil nézet renderelése ---

    if (!isMobile) {
      // 1. ASZTALI NÉZET
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
      // 2. MOBIL NÉZET
      return Scaffold(
        backgroundColor: const Color(0xFFf0f0f0),
        drawer: const Drawer(
          child: CvSidebar(),
        ),
        appBar: AppBar(
          backgroundColor: sidebarBgColor,
          title: Text(
            isEnglish ? 'CV' : 'CV',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Domine', // <-- Itt használjuk a másik betűtípust (Domine)
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: languageButton,
            ),
          ],
        ),
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