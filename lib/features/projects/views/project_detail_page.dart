import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/playstore_button.dart';

class ProjectDetailPage extends ResponsiveStatelessWidget {
  final ProjectData projectData;

  const ProjectDetailPage({super.key, required this.projectData});

  final double? width = 900;

  @override
  Widget buildDesktop(BuildContext context) {
    return buildProjectDetailDesktopPage(context);
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildProjectDetailPage(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildProjectDetailPage(context);
  }

  Widget buildProjectDetailDesktopPage(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32),
          buildBackButton(),
          Container(
            width: width,
            margin: EdgeInsets.all(22),
            padding: EdgeInsets.symmetric(vertical: 22),
            decoration: buildBoxDecoration(),
            child: Column(
              children: [
                Row(
                  children: [
                    buildCarousel(),
                    SizedBox(width: 22),
                    Expanded(child: buildProjectDetails(false)),
                  ],
                ),
                SizedBox(height: 22),
                HorizontalLine(),
                Text(
                  "Tech and more",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                HorizontalLine(),
                buildMarkdown()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMarkdown() {
    return Container(
      height: 400,
      width: width,
      child: SelectionArea(
        child: Markdown(
          data: '''
# driftic (Drift Isolate Cache)

A Flutter project for the drift isolate in-memory, and persistence databases.
Having multi instances of databases table's data access at once.

## Getting Started

Use FVM if you have or quickly install FVM based on you OS via this [link](https://fvm.app/documentation/getting-started/installation)

Using force will pull the required version for the project.
```bash
fvm use --force
```

Then, run the following command to get the required dependencies, and gen files for the project.
```bash
chmod +x ./build.sh
```

```bash
./build.sh
```


Available Screens:

- [x] Multi-Dynamic In-Memory Drift Isolate Based on user's interest.
- [x] Multi Persistence Drift Isolate.
        ''',
          selectable: true,
          styleSheet: MarkdownStyleSheet(
            // h1: const TextStyle(fontSize: 24, color: Colors.blue),
            code: TextStyle(fontSize: 14, backgroundColor: Colors.grey[100]),
            codeblockPadding: EdgeInsets.all(8),
            codeblockDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ), // new end
          ),
        ),
      ),
    );
  }

  Widget buildProjectDetailPage(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: buildBackButton(),
          ),
          Container(
            width: width,
            margin: EdgeInsets.all(22),
            padding: EdgeInsets.symmetric(vertical: 22),
            decoration: buildBoxDecoration(),
            child: Column(
              children: [
                buildCarousel(),
                buildProjectDetails(true),
                SizedBox(height: 55),
                HorizontalLine(),
                Text(
                  "Tech and more",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                HorizontalLine(),
                buildMarkdown(),
                SizedBox(height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(),
    );
  }

  Container buildBackButton() {
    return Container(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: BackButton(),
      ),
    );
  }

  Widget buildProjectDetailCarouselView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCarousel(),
        SizedBox(height: 22),
        buildProjectDetails(true),
      ],
    );
  }

  Widget buildCarousel() {
    return Container(
      width: 300,
      height: 400,
      child: CarouselSlider.builder(
        itemCount: projectData.images.length,
        itemBuilder: (context, i, _) => Image.asset(projectData.images[i]),
        options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
      ),
    );
  }

  Widget buildProjectDetails(bool shouldAddPadding) {
    return Container(
      padding: shouldAddPadding
          ? EdgeInsets.symmetric(horizontal: 22)
          : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleAndLine(title: projectData.name),
          Text(projectData.description, textAlign: TextAlign.center),
          SizedBox(height: 12),
          PlaystoreButton(url: projectData.playStoreUrl!),
          SizedBox(height: 12),
          ...techUsed(),
        ],
      ),
    );
  }

  List<Widget> techUsed() {
    return [
      Text("Tech used"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...?projectData.techIconAssets
              ?.map((e) => Image.asset(e, scale: 2))
              .toList(),
          ...?projectData.techIcons?.map((e) => Icon(e)).toList(),
        ],
      )
    ];
  }
}
