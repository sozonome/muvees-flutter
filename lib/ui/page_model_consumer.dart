import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muvees/core/page_models/page_model.dart';

class PageModelConsumer<T extends PageModel<P>, P>
    extends ConsumerStatefulWidget {
  const PageModelConsumer({
    required this.builder,
    required this.pageModel,
    this.onModelReady,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    P state,
    T notifier,
  ) builder;
  final StateNotifierProvider<T, P> pageModel;
  final void Function(T)? onModelReady;

  @override
  _PageModelConsumerState<T, P> createState() =>
      _PageModelConsumerState<T, P>();
}

class _PageModelConsumerState<T extends PageModel<P>, P>
    extends ConsumerState<PageModelConsumer<T, P>> with RouteAware {
  @override
  void initState() {
    final T notifier = ref.read(widget.pageModel.notifier);
    widget.onModelReady?.call(notifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final P state = ref.watch(widget.pageModel);
    final T notifier = ref.watch(widget.pageModel.notifier);

    return widget.builder(
      context,
      state,
      notifier,
    );
  }
}
