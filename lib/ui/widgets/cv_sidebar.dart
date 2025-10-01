import 'package:cv/ui/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // <-- EZ AZ IMPORT KELL A context.watch() MIATT!


import '../../cubit/language_cubit.dart';
import '../../data/cv_data.dart';
import '../../styles.dart';

class CvSidebar extends StatelessWidget {
  const CvSidebar({super.key});

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
            Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 5),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 0, spreadRadius: 3)
                  ],
                ),
                child: const ClipOval(
                  // A kép elérési útja a pubspec.yaml alapján
                  child: Image(image: AssetImage('assets/image.jpg'), fit: BoxFit.cover),
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