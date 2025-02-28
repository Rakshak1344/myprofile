import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/arch/view/widgets/responsive_stateless_widget.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:profile/features/profile/views/widgets/horizontal_line.dart';
import 'package:profile/features/projects/data/models/project_data.dart';
import 'package:profile/features/projects/views/widgets/playstore_button.dart';
import 'package:profile/resources/resources.dart';

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
    return buildProjectDetailPage();
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildProjectDetailPage();
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProjectDetailPage() {
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
                buildCarousel(),
                buildProjectDetails(true),
                Center(child: Text(projectData.name)),
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
        itemBuilder: (context, i, _) =>
            CachedNetworkImage(imageUrl: projectData.images[i]),
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
