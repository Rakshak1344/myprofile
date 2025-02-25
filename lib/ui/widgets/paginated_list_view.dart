import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginatedListView<T> extends StatefulWidget {
  final List<T> items;
  final AsyncCallback onRefresh;
  final AsyncValueSetter<int?> updatePageNumber;
  final Widget Function(T) buildItem;
  final String noMoreItemsText;
  final bool hasMore;

  const PaginatedListView({
    super.key,
    required this.items,
    required this.onRefresh,
    required this.updatePageNumber,
    required this.noMoreItemsText,
    required this.buildItem,
    required this.hasMore,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(listenOnScrollController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.updatePageNumber(1);
    });
  }

  Future<void> listenOnScrollController() async {
    var offset = scrollController.offset;
    var maxScrollExtent = scrollController.position.maxScrollExtent;
    if (maxScrollExtent == offset) {
      await widget.updatePageNumber(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        padding: const EdgeInsets.only(top: 16),
        itemCount: widget.items.length + 1,
        itemBuilder: (context, i) {
          if (i < widget.items.length) {
            return widget.buildItem(widget.items[i]);
          } else {
            return buildLoadingOrNoMoreItem();
          }
        },
      ),
    );
  }

  Widget buildLoadingOrNoMoreItem() {
    return SizedBox(
      height: 60,
      child: Center(
        child: Visibility(
          visible: widget.hasMore,
          replacement: Text(widget.noMoreItemsText),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(listenOnScrollController);
    scrollController.dispose();
  }
}
