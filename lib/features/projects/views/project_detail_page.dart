import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:profile/arch/config/app_config.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/markdown_preview.dart';
import 'package:profile/features/projects/views/widgets/url_button.dart';

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
                if (projectData.readmeContentOrLink != null) ...[
                  ...buildContentTitle(context, "More on ${projectData.name}"),
                  buildMarkdown(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildContentTitle(context, String title) {
    return [
      HorizontalLine(),
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      HorizontalLine(),
    ];
  }

  Widget buildMarkdown() {
    return Container(
      height: 400,
      width: width,
      child:
          MarkdownPreview(readmeContentOrLink: projectData.readmeContentOrLink),
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
                if (projectData.readmeContentOrLink != null) ...[
                  ...buildContentTitle(context, "More on ${projectData.name}"),
                  buildMarkdown(),
                ],
                // ...buildContentTitle(context, "More on ${projectData.name}"),
                // SizedBox(height: 22),
                // if (projectData.readmeContentOrLink != null) ...[
                //   ...buildContentTitle(context, "Architectural"),
                //   buildMarkdown(),
                // ],
                // SizedBox(height: 22),
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
        disableGesture: true,
        itemCount: projectData.images.length,
        itemBuilder: (context, i, _) => Image.asset(projectData.images[i]),
        options: CarouselOptions(
          enableInfiniteScroll: projectData.images.length > 1,
          autoPlay: projectData.images.length > 1,
          enlargeCenterPage: true,
          scrollPhysics: projectData.images.length > 1
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget buildProjectDetails(bool shouldAddPadding) {
    var context = AppConfig.navigatorKey.currentContext;
    return Container(
      padding: shouldAddPadding
          ? EdgeInsets.symmetric(horizontal: 22)
          : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            projectData.name,
            style: Theme.of(context!).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Text(projectData.description, textAlign: TextAlign.center),
          SizedBox(height: 12),
          buildButtons(),
          SizedBox(height: 12),
          ...techUsed(),
        ],
      ),
    );
  }

  Widget buildButtons() {
    var urls = [
      projectData.playStoreUrl,
      projectData.gitHubUrl,
      projectData.pubDevUrl,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: urls.map((url) {
        if (url == null) return SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: UrlButton(url: url),
        );
      }).toList(),
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
