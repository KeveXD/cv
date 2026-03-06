// Adatstruktúrák a típusos adatokhoz
import 'package:flutter/material.dart';

class ContactItem {
  final IconData icon;
  final String hu;
  final String en;
  final String? url;

  ContactItem({required this.icon, required this.hu, required this.en, this.url});
}

class EducationItem {
  final String huInstitution;
  final String enInstitution;
  final String huDetails;
  final String enDetails;
  final String url;

  EducationItem({
    required this.huInstitution,
    required this.enInstitution,
    required this.huDetails,
    required this.enDetails,
    required this.url,
  });
}

class ExperienceItem {
  final String huDuration;
  final String huCompany;
  final String enDuration;
  final String enCompany;
  final String huJobTitle;
  final String enJobTitle;
  final List<String> huDetails;
  final List<String> enDetails;

  ExperienceItem({
    required this.huDuration,
    required this.huCompany,
    required this.enDuration,
    required this.enCompany,
    required this.huJobTitle,
    required this.enJobTitle,
    required this.huDetails,
    required this.enDetails,
  });
}

// A CV-ben szereplő összes statikus adat egy helyen
abstract class CvData {
  // Személyes adatok
  static const String huName = 'Balla Keve';
  static const String enName = 'Keve Balla';
  static const String huJobTitle = 'Mobil szoftverfejlesztő';
  static const String enJobTitle = 'Mobile Software Developer';

  // Kapcsolat
  static final List<ContactItem> contact = [
    ContactItem(icon: Icons.email, hu: 'keve.balla@gmail.com', en: 'keve.balla@gmail.com'),
    ContactItem(icon: Icons.phone, hu: '+36209470149', en: '+36209470149'),
    ContactItem(icon: Icons.home, hu: 'Magyarország, Budapest', en: 'Budapest, Hungary'),
    ContactItem(
      icon: Icons.link,
      hu: 'Balla Keve LinkedIn',
      en: 'Balla Keve LinkedIn',
      url: 'https://www.linkedin.com/in/keve-balla-7a2622286/',
    ),
  ];

  // Tanulmányok
  static final List<EducationItem> education = [
    EducationItem(
      huInstitution: 'BME VIK',
      enInstitution: 'Budapest University of Technology and Economics (BME)',
      huDetails: 'Mérnökinformatikus MSc, 2024 - folyamatban \n(végzés: 2026 jún.)',
      enDetails: 'Computer Science Engineering MSc, 2024 - ongoing \n(finishing: June, 2026)',
      url: 'https://www.bme.hu/en',
    ),
    EducationItem(
      huInstitution: 'BME VIK',
      enInstitution: 'Budapest University of Technology and Economics (BME)',
      huDetails: 'Mérnökinformatikus BSc, 2020-2024',
      enDetails: 'Computer Science Engineering BSc, 2020-2024',
      url: 'https://www.bme.hu/en',
    ),
    EducationItem(
      huInstitution: 'Budapesti Berzsenyi Dániel Gimnázium',
      enInstitution: 'Berzsenyi Dániel High School, Budapest',
      huDetails: 'Fizika szak, 2016-2020',
      enDetails: 'Physics specialization, 2016-2020',
      url: 'https://www.berzsenyi.hu/',
    ),


  ];

  // Készségek
  static final List<String> huSkills = [
    'Flutter, Dart',
    'REST API integráció',
    'Git verziókezelés',
    'Mobil UI fejlesztése',
    'Rendszerszintű gondolkodás',
    'Szoftverarchitektúra minták és tervezési elvek ismerete'
  ];
  static final List<String> enSkills = [
    'Flutter, Dart',
    'REST API integration',
    'Git',
    'Mobile UI development',
    'Debugging & problem solving',
    'System design thinking',
    'Software architecture patterns & design principles'
  ];

  // Rólam
  static const String huAboutMe = "Szakmai fókuszom elsősorban a mobilfejlesztés. Flutterrel dolgoztam korábbi munkahelyemen, egyetemi és saját projekteken. Ebben vagyok igazán jó. Az informatika azon területeit szeretem, ahol gondolkodni kell, rendszert, automatizálást építeni, skálázható jól struktúrált megoldásokat kell tervezni.";

  static const String enAboutMe = "My professional focus is primarily on mobile development. I have worked with Flutter at my previous job, as well as on university and personal projects. This is the area where I excel. I am most interested in areas of IT that require analytical thinking, building systems and automation, and designing scalable, well-structured solutions.";
  static final List<ExperienceItem> workExperience = [
    ExperienceItem(
      huDuration: '2024 január - 2025 október',
      enDuration: 'January 2024 - October 2025',
      huCompany: 'Ulyssys Kft.',
      enCompany: 'Ulyssys Ltd.',
      huJobTitle: 'Mobil szoftverfejlesztő',
      enJobTitle: 'Mobile Software Developer',
      huDetails: [
        'Mobilgazda app funkcióinak kialakítása',
        'Adatbázis-kezelés és szerverrel való kommunikáció',
        'Illeszkedő design kialakítása és keretrendszerbe passzoló kód írása',
        'Belső rendszer átirása Flutter keretbe (frontend oldal)',
        'Megkapott designok és widgetek implementálása, szerverről érkező adatok feldolgozása',
      ],
      enDetails: [
        'Development of Mobilegazda app features',
        'Database management and server communication',
        'Implementing matching design and framework-compliant code',
        'Rewriting an internal system to the Flutter framework (frontend)',
        'Implementing provided designs and widgets, processing data from the server',
      ],
    ),
    ExperienceItem(
      huDuration: '2023 - jelenleg',
      enDuration: '2023 - present',
      huCompany: 'Mathias Corvinus Collegium (MCC)',
      enCompany: 'Mathias Corvinus Collegium (MCC)',
      huJobTitle: 'FIT Program Oktató',
      enJobTitle: 'FIT Program Instructor',
      huDetails: [
        'Előadások és interaktív foglalkozások tartása általános iskolások számára a FIT programban',
        'Fókusz a tudatos internet használat és online viselkedés és annak veszélyeire való felhívás',
      ],
      enDetails: [
        'Holding lectures and interactive sessions for primary school students in the FIT program',
        'Focus on promoting responsible internet usage and online conduct',
      ],
    ),


    ExperienceItem(
      huDuration: '2024 - jelenleg',
      enDuration: '2024 - present',
      huCompany: 'Magyar Cserkészszövetség (önkéntes)',
      enCompany: 'Hungarian Scout Association (volunteer)',
      huJobTitle: 'Csapatparancsnok',
      enJobTitle: 'Scout Master',
      huDetails: [
        'Közel 300 fős cserkészcsapat irányítása',
        'Fiatal vezetők képzése és programok menedzselése',
        'Vezetők kiválasztása, pénzügyi és pedagógiai keretek kialakítása',
      ],
      enDetails: [
        'Leading a scout team of approximately 300 members',
        'Training junior leaders and managing programs',
        'Leader selection, and establishing financial and pedagogical frameworks',
      ],
    ),


  ];

  // Nyelvek
  static final List<Map<String, String>> languages = [
    {'hu': 'Angol', 'en': 'English (Professional working proficiency)'},
    {'hu': 'Magyar', 'en': 'Hungarian (Native)'},
  ];
}