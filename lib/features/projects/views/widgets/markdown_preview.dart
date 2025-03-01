import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile/arch/view/riverpod_widgets/responsive_consumer_stateful_widget.dart';
import 'package:http/http.dart' as http;
import 'package:profile/utils/url_launcher_extension.dart';

class MarkdownPreview extends ResponsiveConsumerStatefulWidget {
  final String? title;
  final String? readmeContentOrLink;

  const MarkdownPreview({
    Key? key,
    required this.readmeContentOrLink,
    this.title = "Readme.md",
  }) : super(key: key);

  ResponsiveConsumerState<MarkdownPreview> createState() =>
      _MarkdownPreviewState();
}

class _MarkdownPreviewState extends ResponsiveConsumerState<MarkdownPreview> {
  String? _markdownData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMarkdown();
  }

  Future<void> _fetchMarkdown() async {
    if (widget.readmeContentOrLink == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Readme Url")));
      setState(() => _isLoading = false);
      return;
    }
    var isNetworkMarkdown = widget.readmeContentOrLink!.startsWith('https') ||
        widget.readmeContentOrLink!.startsWith('http');

    if (!isNetworkMarkdown) {
      _markdownData =
          widget.readmeContentOrLink; // Sets the hardcoded markdown content.
      setState(() => _isLoading = false);
      return;
    }

    try {
      setState(() => _isLoading = true);
      final response = await http.get(Uri.parse(widget.readmeContentOrLink!));
      if (response.statusCode == 200) {
        setState(() {
          _markdownData = response.body;
          _isLoading = false;
        });
        return;
      }
      setState(() {
        _markdownData = "Failed to load README.md";
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _markdownData = "Error loading README.md";
        _isLoading = false;
      });
    }
  }

  @override
  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return buildMarkdownWidget();
  }

  @override
  Widget buildTablet(BuildContext context, WidgetRef ref) {
    return buildMarkdownWidget();
  }

  @override
  Widget buildDesktop(BuildContext context, WidgetRef ref) {
    return buildMarkdownWidget();
  }

  Widget buildMarkdownWidget() {
    if (_isLoading) {
      return buildLoading();
    }

    return buildSelectionAreaMarkdown();
  }

  Widget buildLoading() {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildSelectionAreaMarkdown() {
    return SelectionArea(
      child: Markdown(
        data: _markdownData!,
        selectable: true,
        onTapLink: (text, href, title) => href.launchURL(),
        styleSheet: MarkdownStyleSheet(
          // h1: const TextStyle(fontSize: 24, color: Colors.blue),
          code: TextStyle(fontSize: 14, backgroundColor: Colors.grey[100]),
          codeblockPadding: EdgeInsets.all(8),
          codeblockDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
          ),
        ),
      ),
    );
  }
}
