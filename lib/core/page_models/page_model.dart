import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PageModel<T> extends StateNotifier<T> {
  PageModel(T state) : super(state);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  dynamic initPageModel();

  void setIsLoading(bool value) {
    _isLoading = value;
  }
}
