import 'package:flutter/material.dart';
import 'package:profile/features/career/data/company_data.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';

import 'package:timeline_tile/timeline_tile.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          TitleAndLine(
            preTitle: "My",
            title: "Experience",
          ),
          SizedBox(height: 40),
          ...buildCareer(CompanyData.myCompanyData, context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> buildCareer(
    List<CompanyData> careerTimeline,
    BuildContext context,
  ) {
    return List.generate(
      careerTimeline.length,
      (index) => TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: index == 0,
        isLast: index == careerTimeline.length - 1,
        indicatorStyle: IndicatorStyle(
          width: 60,
          height: 60,
          indicator: ClipOval(
            child: Image.asset(
              careerTimeline[index].logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        beforeLineStyle: LineStyle(
          color: Theme.of(context).colorScheme.secondary,
          thickness: 3,
        ),
        endChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${careerTimeline[index].name} | ${careerTimeline[index].designatedAs} ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "${careerTimeline[index].locatedAt} | ${careerTimeline[index].startData} - ${careerTimeline[index].endData}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                careerTimeline[index].description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Highlights:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(
                child: Text(
                  careerTimeline[index].highlights,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              HorizontalLine()
            ],
          ),
        ),
      ),
    );
  }
}
