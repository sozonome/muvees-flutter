import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PageStateNotifier<T> extends StateNotifier<T> {
  PageStateNotifier(T state) : super(state);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  dynamic initPageModel();

  void setIsLoading(bool value) {
    _isLoading = value;
  }
}
