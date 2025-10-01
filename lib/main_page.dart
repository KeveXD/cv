/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Színkonstansok a CSS alapján a könnyebb olvashatóságért
const Color primaryTextColor = Color(0xFF333333);
const Color secondaryTextColor = Color(0xFF7f8c8d);
const Color sidebarBgColor = Color(0xFF2c3e50);
const Color sidebarTextColor = Colors.white;
const Color sidebarMutedTextColor = Color(0xFFaebfd0);
const Color dividerColor = Color(0xFFbdc3c7);
const Color sidebarDividerColor = Color(0xFF5d758c);

// A main.dart fájl által hívott fő widget
class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balla Keve - CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const CvScreen(),
    );
  }
}

// Az önéletrajz képernyő, ami az állapotot (nyelv) kezeli
class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  _CvScreenState createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  bool _isEnglish = false;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  // Link megnyitása böngészőben az url_launcher segítségével
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // A képernyő méretéhez igazodó szélesség
    final screenWidth = MediaQuery.of(context).size.width;
    final cvWidth = screenWidth > 850 ? 800.0 : screenWidth * 0.95;

    return Scaffold(
      backgroundColor: const Color(0xFFf0f0f0),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Container(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3, // 30%
                      child: _buildSidebar(double.infinity),
                    ),
                    Expanded(
                      flex: 7, // 70%
                      child: _buildMainContent(double.infinity),
                    ),
                  ],
                ),

              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _toggleLanguage,
              style: ElevatedButton.styleFrom(
                backgroundColor: sidebarBgColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              ),
              child: Text(
                _isEnglish ? 'Magyar / English' : 'English / Magyar',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // A bal oldali, sötét sáv felépítése
  Widget _buildSidebar(double width) {
    return Container(
      width: width,
      color: sidebarBgColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 5),
                boxShadow: [
                  const BoxShadow(color: Colors.white, blurRadius: 0, spreadRadius: 3)
                ],
              ),
              child: const ClipOval(
                // A kép elérési útja a pubspec.yaml alapján
                child: Image(image: AssetImage('assets/image.jpg'), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (_isEnglish)
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                'Hungarian and American Citizen (SSN available)',
                style: TextStyle(color: sidebarTextColor, fontSize: 13.5),
              ),
            ),
          _SidebarSection(
            title: _isEnglish ? 'Contact' : 'Kapcsolat',
            children: [
              _ContactInfo(icon: Icons.email, text: 'keve.balla@gmail.com'),
              _ContactInfo(icon: Icons.phone, text: '+36209470149'),
              _ContactInfo(icon: Icons.home, text: 'Budapest, Szenttamás utca 23'),
              _ContactInfo(
                icon: Icons.link,
                text: 'Balla Keve LinkedIn',
                isLink: true,
                onTap: () => _launchURL('https://www.linkedin.com/in/keve-balla-7a2622286/'),
              ),
            ],
          ),
          _SidebarSection(
            title: _isEnglish ? 'Education' : 'Tanulmányok',
            children: [
              _EducationItem(
                institution: _isEnglish ? 'Berzsenyi Dániel High School, Budapest' : 'Budapesti Berzsenyi Dániel Gimnázium',
                details: _isEnglish ? 'Physics specialization, 2016-2020' : 'Fizika szak, 2016-2020',
                onTap: () => _launchURL('https://www.berzsenyi.hu/'),
              ),
              _EducationItem(
                institution: _isEnglish ? 'Budapest University of Technology and Economics (BME)' : 'BME VIK',
                details: _isEnglish ? 'Computer Science Engineering BSc, 2020-2024' : 'Mérnökinformatikus BSc, 2020-2024',
                onTap: () => _launchURL('https://www.bme.hu/en'),
              ),
              _EducationItem(
                institution: _isEnglish ? 'Budapest University of Technology and Economics (BME)' : 'BME VIK',
                details: _isEnglish ? 'Computer Science Engineering MSc, 2024 - ongoing' : 'Mérnökinformatikus MSc, 2024 - folyamatban',
                onTap: () => _launchURL('https://www.bme.hu/en'),
              ),
            ],
          ),
          _SidebarSection(
            title: _isEnglish ? 'Skills' : 'Készségek',
            children: [
              _SkillItem(text: _isEnglish ? 'Mobile Software Development' : 'Mobil szoftverfejlesztés'),
              _SkillItem(text: _isEnglish ? 'Cross-platform Flutter Development' : 'Cross-platform Flutter fejlesztés'),
              _SkillItem(text: _isEnglish ? 'Programming: Dart, Python, Java' : 'Programozás: Dart, Python, Java'),
              _SkillItem(text: _isEnglish ? 'Database Management and Server Communication' : 'Adatbázis-kezelés és szerverkommunikáció'),
              _SkillItem(text: _isEnglish ? 'Frontend and UI/UX Design' : 'Frontend és UI/UX tervezés'),
              _SkillItem(text: _isEnglish ? 'Agile Methodologies and Project Management' : 'Agilis módszertanok és projektmenedzsment'),
            ],
          ),
          _SidebarSection(
            title: _isEnglish ? 'Languages' : 'Nyelvek',
            children: [
              Text(_isEnglish ? 'English (Professional working proficiency)' : 'Angol', style: const TextStyle(color: sidebarTextColor, fontSize: 13.5)),
              const SizedBox(height: 5),
              Text(_isEnglish ? 'Hungarian (Native)' : 'Magyar', style: const TextStyle(color: sidebarTextColor, fontSize: 13.5)),
            ],
          ),
        ],
      ),
    );
  }

  // A jobb oldali, fehér tartalomrész felépítése
  Widget _buildMainContent(double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isEnglish ? 'Keve Balla' : 'Balla Keve',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: primaryTextColor,
              height: 1,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            (_isEnglish ? 'Mobile Software Developer' : 'Mobil szoftverfejlesztő').toUpperCase(),
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: secondaryTextColor,
            ),
          ),
          const SizedBox(height: 30),
          _MainSection(
            title: _isEnglish ? 'About Me' : 'Rólam',
            child: Text(
              _isEnglish
                  ? "My professional focus is mobile software development, while exploring different areas of software development. I am not afraid of new challenges and always find solutions, even if not the easiest path. I have experimented with many technologies in university, workplace, and personal projects, which allows me me to learn quickly and have a broad understanding of various systems. I am particularly drawn to areas of IT where I can create something new and think creatively about problem-solving, while research and testing are less appealing to me."
                  : "Szakmai fókuszom a mobil szoftverfejlesztés és különböző szoftverfejlesztési területeken a tapasztalatszerzés. Nem félek új feladatoktól, és mindig megtalálom a megoldást, még ha nem is a legegyszerűbb úton. Számos technológiát kipróbáltam egyetemi, munkahelyi és saját projektekben, így gyorsan tanulok és átfogó rálátásom van a különböző rendszerekre. Az informatika azon területei vonzanak leginkább, ahol alkotni lehet valami újat és kreatívan gondolkodhatok a problémák megoldásán; kevésbé érdekel a kutatás és a tesztelés.",
              style: const TextStyle(fontSize: 15, height: 1.6, color: primaryTextColor),
            ),
          ),
          _MainSection(
            title: _isEnglish ? 'Work Experience' : 'Munkatapasztalat',
            child: Column(
              children: [
                _ExperienceItem(
                  duration: _isEnglish ? '2015-2019' : '2015-2019',
                  company: 'Nagy és Társa Kft. (Húsbolt/Élelmiszeripar)',
                  jobTitle: _isEnglish ? 'Hospitality Assistant / Butcher Shop' : 'Vendéglátóipari asszisztens',
                  details: [
                    _isEnglish ? 'Required precision, reliability, long working hours, and excellent customer communication skills.' : 'Precíz és megbízható munkavégzés, hosszú műszakok betartása, kommunikáció a vásárlókkal.',
                    _isEnglish ? 'Serving customers, handling cash transactions, and strictly adhering to hygiene standards in the food service industry.' : 'Pultos és hátsós munka, pénztárkezelés és higiéniai előírások betartása.',
                  ],
                ),
                _ExperienceItem(
                  duration: _isEnglish ? '2019 - present' : '2019 - jelenleg',
                  company: _isEnglish ? 'Tutoring' : 'Felkészítés',
                  jobTitle: _isEnglish ? 'Mathematics Tutoring for Entrance Exams and High School Finals' : 'Matematika felkészítés felvételire és érettségire',
                  details: const [],
                ),
                _ExperienceItem(
                  duration: _isEnglish ? 'January 2024 - June 2025' : '2024 január - 2025 október',
                  company: 'Ulyssys Kft.',
                  jobTitle: _isEnglish ? 'Mobile Software Developer' : 'Mobil szoftverfejlesztő',
                  details: [
                    _isEnglish ? 'Development of Mobilegazda app features' : 'Mobilgazda app funkcióinak kialakítása',
                    _isEnglish ? 'Database management and server communication' : 'Adatbázis-kezelés és szerverrel való kommunikáció',
                    _isEnglish ? 'Implementing matching design and framework-compliant code' : 'Illeszkedő design kialakítása és keretrendszerbe passzoló kód írása',
                    _isEnglish ? 'Rewriting an internal system to the Flutter framework (frontend)' : 'Belső rendszer átirása Flutter keretbe (frontend oldal)',
                    _isEnglish ? 'Implementing provided designs and widgets, processing data from the server' : 'Megkapott designok és widgetek implementálása, szerverről érkező adatok feldolgozása',
                  ],
                ),
                _ExperienceItem(
                  duration: _isEnglish ? '2023 - present' : '2023 - jelenleg',
                  company: 'Mathias Corvinus Collegium (MCC)',
                  jobTitle: _isEnglish ? 'FIT Program Instructor' : 'FIT Program Oktató',
                  details: [
                    _isEnglish ? 'Holding lectures and interactive sessions for primary school students in the FIT program' : 'Előadások és interaktív foglalkozások tartása általános iskolások számára a FIT programban',
                    _isEnglish ? 'Focus on promoting responsible internet usage and online conduct' : 'Fókusz a tudatos internet használat és online viselkedés és annak veszélyeire való felhívás',
                  ],
                ),
                _ExperienceItem(
                  duration: _isEnglish ? '2024 - present' : '2024 - jelenleg',
                  company: 'Magyar Cserkészszövetség',
                  jobTitle: _isEnglish ? 'Scout Master' : 'Csapatparancsnok',
                  details: [
                    _isEnglish ? 'Leading a scout team of approximately 300 members' : 'Körülbelül 300 fős cserkészcsapat irányítása',
                    _isEnglish ? 'Training junior leaders and organizing programs' : 'Fiatal vezetők képzése és programok szervezése',
                    _isEnglish ? 'Strategic decisions in leader selection, establishment of financial and pedagogical frameworks' : 'Stratégiai döntések a vezetők kiválasztásában, pénzügyi és pedagógiai keretek kialakítása',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---- EGYEDI SEGÉD-WIDGETEK A TISZTÁBB KÓDÉRT ----

class _SidebarSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SidebarSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.w700, color: sidebarTextColor),
          ),
          Container(height: 2, width: double.infinity, color: sidebarDividerColor, margin: const EdgeInsets.only(top: 5, bottom: 15)),
          ...children,
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLink;
  final VoidCallback? onTap;
  const _ContactInfo({required this.icon, required this.text, this.isLink = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(icon, color: sidebarTextColor, size: 20),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: TextStyle(color: sidebarTextColor, fontSize: 13.5, decoration: isLink ? TextDecoration.underline : TextDecoration.none))),
          ],
        ),
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String institution;
  final String details;
  final VoidCallback onTap;
  const _EducationItem({required this.institution, required this.details, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(institution, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: sidebarTextColor)),
            const SizedBox(height: 2),
            Text(details, style: const TextStyle(fontSize: 13, color: sidebarMutedTextColor)),
          ],
        ),
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  final String text;
  const _SkillItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: sidebarTextColor, fontWeight: FontWeight.bold, fontSize: 13.5)),
          Expanded(child: Text(text, style: const TextStyle(color: sidebarTextColor, fontSize: 13.5))),
        ],
      ),
    );
  }
}

class _MainSection extends StatelessWidget {
  final String title;
  final Widget child;
  const _MainSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.w700, color: primaryTextColor),
          ),
          Container(height: 2, width: double.infinity, color: dividerColor, margin: const EdgeInsets.only(top: 5, bottom: 15)),
          child,
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String duration;
  final String company;
  final String jobTitle;
  final List<String> details;
  const _ExperienceItem({required this.duration, required this.company, required this.jobTitle, required this.details});

  @override
  Widget build(BuildContext context) {
    List<String> displayDetails = details.isEmpty ? [''] : details;

    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(duration, style: const TextStyle(fontSize: 14, color: secondaryTextColor)),
          const SizedBox(height: 4),
          Text(company, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryTextColor)),
          const SizedBox(height: 2),
          Text(jobTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: sidebarBgColor)),
          const SizedBox(height: 8),
          ...displayDetails.map((detail) => Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(color: primaryTextColor, fontSize: 15, height: 1.5)),
                Expanded(child: Text(detail, style: const TextStyle(fontSize: 15, color: primaryTextColor, height: 1.5))),
              ],
            ),
          )).toList(),
        ],
      ),
    );

  }
}*/