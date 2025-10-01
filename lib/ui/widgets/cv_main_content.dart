import 'package:cv/ui/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/language_cubit.dart';
import '../../data/cv_data.dart';
import '../../styles.dart';


class CvMainContent extends StatelessWidget {
  const CvMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Figyeli a LanguageCubit állapotát
    final isEnglish = context.watch<LanguageCubit>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fő cím és Alcím
          Text(
            isEnglish ? CvData.enName : CvData.huName,
            style: CvStyles.mainTitleStyle,
          ),
          const SizedBox(height: 5),
          Text(
            (isEnglish ? CvData.enJobTitle : CvData.huJobTitle).toUpperCase(),
            style: CvStyles.subTitleStyle,
          ),
          const SizedBox(height: 30),

          // Rólam szakasz
          MainSectionWidget(
            title: isEnglish ? 'About Me' : 'Rólam',
            child: Text(
              isEnglish ? CvData.enAboutMe : CvData.huAboutMe,
              style: CvStyles.mainTextStyle,
            ),
          ),

          // Munkatapasztalat szakasz
          MainSectionWidget(
            title: isEnglish ? 'Work Experience' : 'Munkatapasztalat',
            child: Column(
              children: CvData.workExperience
                  .map((item) => ExperienceItemWidget(item: item, isEnglish: isEnglish))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}