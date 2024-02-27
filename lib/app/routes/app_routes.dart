part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const TABS = _Paths.TABS;
  static const PRODUCT_LIST = _Paths.PRODUCT_LIST;
  static const SEARCH = _Paths.SEARCH;
}

abstract class _Paths {
  _Paths._();
  static const TABS = '/';
  static const PRODUCT_LIST = '/product-list';
  static const SEARCH = '/search';
}
