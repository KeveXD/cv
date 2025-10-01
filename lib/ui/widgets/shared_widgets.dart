import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/cv_data.dart';
import '../../styles.dart';


// Link megnyitása böngészőben (segédmetódus)
Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

// Oldalsáv szakasz címe és elválasztója
class SidebarSectionHeader extends StatelessWidget {
  final String title;
  const SidebarSectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: CvStyles.sidebarSectionTitleStyle,
        ),
        Container(
            height: 2,
            width: double.infinity,
            color: sidebarDividerColor,
            margin: const EdgeInsets.only(top: 5, bottom: 15)),
      ],
    );
  }
}

// Kapcsolati adat (ikon + szöveg)
class ContactInfoWidget extends StatelessWidget {
  final ContactItem item;
  final bool isEnglish;
  const ContactInfoWidget({required this.item, required this.isEnglish, super.key});

  @override
  Widget build(BuildContext context) {
    final text = isEnglish ? item.en : item.hu;
    final isLink = item.url != null;

    return InkWell(
      onTap: isLink ? () => launchURL(item.url!) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(item.icon, color: sidebarTextColor, size: 20),
            const SizedBox(width: 10),
            Expanded(
                child: Text(text,
                    style: TextStyle(
                        color: sidebarTextColor,
                        fontSize: 13.5,
                        decoration: isLink ? TextDecoration.underline : TextDecoration.none))),
          ],
        ),
      ),
    );
  }
}

// Tanulmányok elem
class EducationItemWidget extends StatelessWidget {
  final EducationItem item;
  final bool isEnglish;
  const EducationItemWidget({required this.item, required this.isEnglish, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () => launchURL(item.url),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isEnglish ? item.enInstitution : item.huInstitution,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: sidebarTextColor)),
            const SizedBox(height: 2),
            Text(isEnglish ? item.enDetails : item.huDetails,
                style: const TextStyle(fontSize: 13, color: sidebarMutedTextColor)),
          ],
        ),
      ),
    );
  }
}

// Készség elem
class SkillItemWidget extends StatelessWidget {
  final String text;
  const SkillItemWidget({required this.text, super.key});

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

// Fő tartalom szakasz
class MainSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const MainSectionWidget({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: CvStyles.mainSectionTitleStyle,
          ),
          Container(
              height: 2,
              width: double.infinity,
              color: dividerColor,
              margin: const EdgeInsets.only(top: 5, bottom: 15)),
          child,
        ],
      ),
    );
  }
}

// Munkatapasztalat elem
class ExperienceItemWidget extends StatelessWidget {
  final ExperienceItem item;
  final bool isEnglish;
  const ExperienceItemWidget({required this.item, required this.isEnglish, super.key});

  @override
  Widget build(BuildContext context) {
    final details = isEnglish ? item.enDetails : item.huDetails;
    final jobTitle = isEnglish ? item.enJobTitle : item.huJobTitle;
    List<String> displayDetails = details.isEmpty ? [''] : details;

    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.duration, style: const TextStyle(fontSize: 14, color: secondaryTextColor)),
          const SizedBox(height: 4),
          Text(item.company, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: primaryTextColor)),
          const SizedBox(height: 2),
          Text(jobTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: sidebarBgColor)),
          const SizedBox(height: 8),
          ...displayDetails.map((detail) => Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(color: primaryTextColor, fontSize: 15, height: 1.5)),
                Expanded(child: Text(detail, style: CvStyles.mainTextStyle.copyWith(height: 1.5))),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}