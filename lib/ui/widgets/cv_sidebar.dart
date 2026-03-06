import 'package:cv/ui/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // <-- EZ AZ IMPORT KELL A context.watch() MIATT!


import '../../cubit/language_cubit.dart';
import '../../data/cv_data.dart';
import '../../styles.dart';

class CvSidebar extends StatelessWidget {
  const CvSidebar({super.key});

  Widget _buildSwipableImage(String assetPath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10), // Kis margó, hogy ne érjenek össze a lapozásnál
      decoration: BoxDecoration(
        color: Colors.white, // A keret színe
        borderRadius: BorderRadius.circular(20), // Kicsit nagyobb, hogy kövesse a kép lekerekítését
        border: Border.all(color: Colors.white, width: 5), // A vastag fehér keret
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          assetPath,
          width: 140,
          height: 140,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Figyeli a LanguageCubit állapotát
    final isEnglish = context.watch<LanguageCubit>().state;

    // A SingleChildScrollView teszi görgethetővé a drawert (becsukható oldalsávot)
    return SingleChildScrollView(
      child: Container(
        color: sidebarBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kép
            // Kép szakasz négyzetes, lekerekített sarkokkal, jobbra egy másik kép
            Center(
              child: Container(
                width: 150, // A teljes méret (kép + keret)
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // A keret külső lekerekítése
                  border: Border.all(color: Colors.white, width: 5), // A fix, vastag fehér keret
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                // A ClipRRect a kereten belülre kerül, így a csúszó képek sarkai is kerekítettek lesznek
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // A kép belső lekerekítése
                  child: PageView(
                    children: [
                      Image.asset(
                        'assets/elso.jpg',
                        fit: BoxFit.cover, // Kitölti a kereten belüli helyet
                      ),
                      Image.asset(
                        'assets/masodik.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Állampolgárság (csak angolul)
            if (isEnglish)
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Hungarian and American Citizen (SSN available)',
                  style: TextStyle(color: sidebarTextColor, fontSize: 13.5),
                ),
              ),

            // Kapcsolat szakasz
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidebarSectionHeader(title: isEnglish ? 'Contact' : 'Kapcsolat'),
                  ...CvData.contact.map((item) => ContactInfoWidget(item: item, isEnglish: isEnglish)).toList(),
                ],
              ),
            ),

            // Tanulmányok szakasz
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidebarSectionHeader(title: isEnglish ? 'Education' : 'Tanulmányok'),
                  ...CvData.education.map((item) => EducationItemWidget(item: item, isEnglish: isEnglish)).toList(),
                ],
              ),
            ),

            // Készségek szakasz
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidebarSectionHeader(title: isEnglish ? 'Skills' : 'Készségek'),
                  ...(isEnglish ? CvData.enSkills : CvData.huSkills).map((text) => SkillItemWidget(text: text)).toList(),
                ],
              ),
            ),

            // Nyelvek szakasz
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SidebarSectionHeader(title: isEnglish ? 'Languages' : 'Nyelvek'),
                  ...CvData.languages.map((lang) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(isEnglish ? lang['en']! : lang['hu']!,
                          style: const TextStyle(color: sidebarTextColor, fontSize: 13.5)),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}