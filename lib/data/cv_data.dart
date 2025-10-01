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
  final String duration;
  final String company;
  final String huJobTitle;
  final String enJobTitle;
  final List<String> huDetails;
  final List<String> enDetails;

  ExperienceItem({
    required this.duration,
    required this.company,
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
      huDetails: 'Mérnökinformatikus MSc, 2024 - folyamatban',
      enDetails: 'Computer Science Engineering MSc, 2024 - ongoing',
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
    'Mobil szoftverfejlesztés',
    'Cross-platform Flutter fejlesztés',
    'Programozás: Dart, C, C++, Java',
    'Adatbázis-kezelés és szerverkommunikáció',
    'Frontend és UI/UX tervezés',
    'Agilis módszertanok és projektmenedzsment',
  ];
  static final List<String> enSkills = [
    'Mobile Software Development',
    'Cross-platform Flutter Development',
    'Programming: Dart, C, C++, Java',
    'Database Management and Server Communication',
    'Frontend and UI/UX Design',
    'Agile Methodologies and Project Management',
  ];

  // Rólam
  static const String huAboutMe = "Szakmai fókuszom elsősorban a mobil szoftverfejlesztés, viszont nyitott vagyok az informatika különböző területeinek megismerésére és kipróbálására is. Az új kihívásokat, lehetőségeket szeretem, és mindig megtalálom a megfelelő megoldást, még akkor is, ha az nem feltétlenül a legegyszerűbb út. Egyetemi tanulmányaim, munkahelyi tapasztalataim és saját projektjeim során sok technológiát alkalmaztam és próbáltam ki, amelyek révén gyorsan tanulok és jó rálátást szereztem különféle rendszerekre. Leginkább az informatika azon területei vonzanak, amik gondolkodtatóak, ahol lehetőség van új dolgok létrehozására és problémamegoldásra, míg a kutatás és a tesztelés kevésbé motiváló számomra.";

  static const String enAboutMe = "My professional focus is mobile software development, while exploring different areas of software development. I am not afraid of new challenges and always find solutions, even if not the easiest path. I have experimented with many technologies in university, workplace, and personal projects, which allows me to learn quickly and have a broad understanding of various systems. I am particularly drawn to areas of IT where I can create something new and think creatively about problem-solving,while research and testing are less appealing to me.";

  // Munkatapasztalat
  static final List<ExperienceItem> workExperience = [
    ExperienceItem(
      duration: '2024 január - 2025 október',
      company: 'Ulyssys Kft.',
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
      duration: '2023 - jelenleg',
      company: 'Mathias Corvinus Collegium (MCC)',
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
      duration: '2019 - jelenleg',
      company: 'Felkészítés',
      huJobTitle: 'Matematika felkészítés felvételire és érettségire',
      enJobTitle: 'Mathematics Tutoring for Entrance Exams and High School Finals',
      huDetails: [],
      enDetails: [],
    ),


    ExperienceItem(
      duration: '2024 - jelenleg',
      company: 'Magyar Cserkészszövetség (önkéntes/volunteer)',
      huJobTitle: 'Csapatparancsnok',
      enJobTitle: 'Scout Master',
      huDetails: [
        'Körülbelül 300 fős cserkészcsapat irányítása',
        'Fiatal vezetők képzése és programok szervezése',
        'Stratégiai döntések a vezetők kiválasztásában, pénzügyi és pedagógiai keretek kialakítása',
      ],
      enDetails: [
        'Leading a scout team of approximately 300 members',
        'Training junior leaders and organizing programs',
        'Strategic decisions in leader selection, establishment of financial and pedagogical frameworks',
      ],
    ),
    ExperienceItem(
      duration: '2015-2019',
      company: 'Nagy és Társa Kft. (Húsbolt/Élelmiszeripar)',
      huJobTitle: 'Vendéglátóipari asszisztens',
      enJobTitle: 'Hospitality Assistant / Butcher Shop',
      huDetails: [
        'Precíz és megbízható munkavégzés, hosszú műszakok betartása, kommunikáció a vásárlókkal.',
        'Pultos és hátsós munka, pénztárkezelés és higiéniai előírások betartása.',
      ],
      enDetails: [
        'Required precision, reliability, long working hours, and excellent customer communication skills.',
        'Serving customers, handling cash transactions, and strictly adhering to hygiene standards in the food service industry.',
      ],
    ),

  ];

  // Nyelvek
  static final List<Map<String, String>> languages = [
    {'hu': 'Angol', 'en': 'English (Professional working proficiency)'},
    {'hu': 'Magyar', 'en': 'Hungarian (Native)'},
  ];
}