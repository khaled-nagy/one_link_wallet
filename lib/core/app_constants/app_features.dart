import 'package:one_link_wallet/core/app_constants/app_constants.dart';
import 'package:one_link_wallet/core/app_datasources/remote_datasource/api_constants.dart';
import 'package:one_link_wallet/features/main_app/presentation/pages/main_app_page.dart';
import 'package:one_link_wallet/main.dart';

class AppFeatures {
  const AppFeatures._();

  /// If enableHandshake is true, the app will call [ApiConstants.handShake] endpoint and use it to access api,
  /// otherwise it will use [ApiConstants.adminToken] as to access api.
  static const bool enableHandshake = true;

  /// If enableAppVersion is true, the app will call [ApiConstants.verifyAppIsUpToDate] endpoint to check if user use the latest version,
  /// otherwise it will never show force update page.
  static const bool enableAppVersion = false;

  /// If enableOnboarding is true, the app will show onboarding screen in first time,
  /// otherwise it will not show onboarding screen.
  static const bool enableOnboarding = true;

  /// If enableImageSliderInProductCard is true, the app will show image slider in product card,
  /// otherwise it will only one image.
  static const bool enableImageSliderInProductCard = true;

  /// If getFiltersFromPlpAggregates is true, the app will get filters from plp aggregates and will not use (Get Filterable Attributes by Category) endpoint,
  /// otherwise it will get filters from [ApiConstants.filters] endpoint.
  static const bool getFiltersFromPlpAggregates = true;

  /// If enableAlgoliaSearch is true, the app will use [ApiConstants.algoliaSearch] endpoint,
  /// otherwise it will use [ApiConstants.apiSearch] endpoint for search.
  static const bool enableAlgoliaSearch = false;

  /// If enableFiltersInSearchScreen is true, the app will show filters in search screen,
  /// otherwise it will not show filters in search screen.
  /// Note this is only applicable if [enableAlgoliaSearch] is false
  /// search screen filters always come from [SearchResultModel] aggregates
  static const bool enableFiltersInSearch = true;

  /// If enableFlixMedia is true, the app will show flix media in product details screen,
  /// otherwise it will not show flix media in product details screen.
  static const bool enableFlixMedia = false;

  /// If enableTestFreaks is true, the app will get reviews from [ApiConstants.getTestFreaksReviewSummary] endpoint,
  /// otherwise it will get reviews from [ApiConstants.getReviews] endpoint.
  static const bool enableTestFreaks = false;

  /// if enableExpertReviews is true, the reviews will depend on both expert and users reviews,
  /// otherwise it will depend only on users reviews.
  /// note: will not effect app when [enableTestFreaks] is false
  static const bool enableExpertReviews = true;

  /// if viewOnlyAppReviews is true, the app will show only app reviews from test freaks,
  /// otherwise it will show all the users reviews come from test freaks.
  /// note: will not effect app when [enableTestFreaks] is false,
  static const bool viewOnlyMyReviews = false;

  /// if enableLoginWithPhone is true, the app will show login with phone tab in login screen,
  /// otherwise it will not show login with phone screen.
  static const bool enablePhoneAuth = false;

  /// if enableCartMerge is true, the app will call merge cart [ApiConstants.mergeCart] endpoint afterLogin,
  /// otherwise it will not merge guest cart after login.
  static const bool enableCartMerge = true;

  /// if is true, delete account will save the deleted account local in shared pref,
  /// if not it will call [ApiConstants.deleteAccount] endpoint
  static const bool localDeleteAccount = false;

  /// if is true, the app will show mokafa section in cart
  static const bool enableMokafaInCart = false;

  /// if is true, the app will show coupon section in cart
  static const bool enableCouponInCart = true;

  /// if is true, the app will show coupon call [ApiConstants.checkoutPromoCode] and show it in success page
  /// otherwise it will not show coupon in success page
  static const bool enableCheckoutPromoCodeInSuccessPage = false;

  /// if is true, the app will call [ApiConstants.trackingNumber] show tracking number in success page
  /// otherwise it will not show tracking number in success page
  static const bool enableTrackingNumberInSuccessPage = false;

  /// if is true, the app will show [PrintInvoiceButton] in success page and order details page
  /// otherwise it will not show print invoice
  static bool enablePrintInvoice = true;

  /// if is true, the app will show return order button in [OrderDetailsPage] when order status is delivered
  /// otherwise it will not show return order button
  static bool enableReturnOrder = true;

  /// if is true, the app will show rate product button in [OrderDetailsPage] when order status is delivered
  /// otherwise it will not show rate product button
  static bool enableRateProduct = true;

  /// if is true, the app will allow compare products in app
  /// otherwise it will not allow
  static bool enableCompare = true;

  /// if is true, the app will enable firebase notifications in app
  /// when true please uncomment firebase setup in [main] and initState in [MainAppPage]
  /// when false comment this configs to be apple to run app
  static bool enableNotifications = true;

  /// if is true, the shipping methods will be enabled in checkout page
  /// otherwise it will not be enabled
  static bool enableShippingMethods = false;

  /// if true, when press on [CartProductItemWidget] it will navigate to pdp
  /// otherwise it will disable the navigation
  static bool enableNavigationFromCartProductItem = true;

  /// if true, after success add item to cart it will view [SuccessAddToCartBottomSheet]
  /// otherwise it will view success snackbar only
  static bool enableSuccessBottomSheet = true;

  /// if true, will get our branches form [ApiConstants.ourBranches] endpoint
  /// otherwise it will set it from constants [AppConstants.ourBranches]
  static bool getBranchesFromApi = true;

  /// if true, it will show map in [OurBranchesPage]
  /// otherwise it will not and view on map will navigate outside app
  /// note: don't forget to set your map key in android manifest and in ios AppDelegate
  static bool enableMapInOurBranches = true;

  /// if true, it will revive cart after checkout failure
  /// otherwise it will not
  static bool enableReviveCartOnFailure = false;
}
