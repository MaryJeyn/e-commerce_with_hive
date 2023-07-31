part of 'app_pages.dart';


abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const BASKET_SCREEN = _Paths.BASKET_SCREEN;
  static const BOTTOM_NAVIGATION_SCREEN = _Paths.BOTTOM_NAVIGATION_SCREEN;
  static const CREATE_PRODUCT_SCREEN = _Paths.CREATE_PRODUCT_SCREEN;
  static const ORDERS_SCREEN = _Paths.ORDERS_SCREEN;
  static const PRODUCT_DETAILS_SCREEN = _Paths.PRODUCT_DETAILS_SCREEN;

}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BASKET_SCREEN = '/basket_screen';
  static const BOTTOM_NAVIGATION_SCREEN = '/bottom_navigation_screen';
  static const CREATE_PRODUCT_SCREEN = '/create_product_screen';
  static const ORDERS_SCREEN = '/orders_screen';
  static const PRODUCT_DETAILS_SCREEN = '/product_details_screen';
  
}
