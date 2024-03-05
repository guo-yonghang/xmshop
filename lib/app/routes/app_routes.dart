part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const TABS = _Paths.TABS;
  static const PRODUCT_LIST = _Paths.PRODUCT_LIST;
  static const SEARCH = _Paths.SEARCH;
  static const SEARCH_CONTENT = _Paths.SEARCH_CONTENT;
  static const PRODUCT_CONTENT = _Paths.PRODUCT_CONTENT;
}

abstract class _Paths {
  _Paths._();
  static const TABS = '/';
  static const PRODUCT_LIST = '/product-list';
  static const SEARCH = '/search';
  static const SEARCH_CONTENT = '/search-content';
  static const PRODUCT_CONTENT = '/product-content';
}
