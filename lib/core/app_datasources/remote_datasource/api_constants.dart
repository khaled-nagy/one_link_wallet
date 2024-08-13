import 'package:one_link_wallet/core/app_constants/app_constants.dart';

import '../../app_constants/app_environment.dart';

final _baseUrl = AppEnvironment.baseUrl;

class ApiConstants {
  const ApiConstants._();

  //admin token to use if no handshake disabled
  static const adminToken = 'admin token';

  //splash feature
  static String handshake = '$_baseUrl/handshake';
  static String verifyAppIsUpToDate = '$_baseUrl/mstore/appVersion';

  //auth
  static String signInWithEmail = '$_baseUrl/customer/login';
  static String requestOTP = '$_baseUrl/customer/login/otp/send';
  static String verifyOTP = '$_baseUrl/customer/login/otp/verify';
  static String createAccount = '$_baseUrl/customer/register/account/create';
  static String resetPassword = '$_baseUrl/customer/forget/resetpassword';
  static String sendResetPasswordEmail = '$_baseUrl/customer/password';
  static String deleteAccount(int customerId) =>
      '$_baseUrl/customer/deleteCustomerAccount/$customerId';
  //handshake
  static String handShake = '$_baseUrl/handshake';

  //home endpoints
  static String homeJson = '$_baseUrl/json/home';

  //customer
  static String profile = '$_baseUrl/customer/me';
  static String changeEmail = '$_baseUrl/customer/changeEmail';
  static String changeName = '$_baseUrl/customer/changeName';
  static String changePassword = '$_baseUrl/customer/changePassword';
  static String address = '$_baseUrl/customer/address';
  static String cities = '$_baseUrl/customer/getCities';
  static String contactUs = '$_baseUrl/mstore/contactUs';
  static String ourBranches = '$_baseUrl/mstore/store-locator';

  //categories
  static String categories = '$_baseUrl/mstore/category/tree';

  //plp
  static String filters(String categoryId) =>
      '$_baseUrl/filterable-attributes/category/$categoryId';
  static String productListWithFilters(String categoryId) =>
      '$_baseUrl/search/products/facets/category/$categoryId';

  //pdp
  static String getProductDetails(String sku) =>
      '$_baseUrl/search/product/$sku';
  static String getProductsBySKUs = '$_baseUrl/search/product';

  // reviews
  static String addReview = '$_baseUrl/product/reviews/add';
  static String getReviews(String sku) => '$_baseUrl/product/reviews/$sku';


 

  //cart
  static String createCart = '$_baseUrl/cart/create';
  static String reviveCart = '$_baseUrl/cart/active';
  static String getCart = '$_baseUrl/cart/details/total';
  static String addMultiToCart = '$_baseUrl/cart/multi/items';
  static String addItemToCart = '$_baseUrl/cart/add/items';
  static String updateCart(String sku) => '$_baseUrl/cart/update/items/$sku';
  static String deleteCartItem(String cartItemId) =>
      '$_baseUrl/cart/delete/items/$cartItemId';
  static String addCoupon(String couponCode) =>
      '$_baseUrl/customer/applyCoupon/$couponCode';
  static String removeCoupon = '$_baseUrl/customer/deleteCoupon';
  static String mergeCart(String guestCartId) =>
      '$_baseUrl/cart/mergeQuote/$guestCartId';
  static String getMokafaOtp = '$_baseUrl/mokafa/get-otp';
  static String redeemMokafaReward = '$_baseUrl/mokafa/applypoint';

  //checkout
  static String shippingUrl = '$_baseUrl/cart/shippingaddress';
  static String createOrderUrl = '$_baseUrl/cart/createOrder';
  static String updateOrderType = '$_baseUrl/customer/updateOrderType';
  static String availableShippingMethods(
          String cartId, String cityId, bool isGuest) =>
      '$_baseUrl/mstore/available-shipping-methods/$cartId/$cityId/${isGuest ? 1 : 0}';

  //orders
  static String orderDetails(String orderId) =>
      '$_baseUrl/customer/orders/$orderId';
  static String orders = '$_baseUrl/customer/orders';
  static String checkoutPromoCode = '$_baseUrl/customer/checkoutCoupon';
  static String returnOrder(String orderId) =>
      '$_baseUrl/customer/returnOrder/$orderId';

  static String trackingNumber(String orderId) =>
      '$_baseUrl/customer/order/tracking/$orderId';

  //payment
  static String getPayfortSettings(String orderId) =>
      "$_baseUrl/payfort/get-order-settings/$orderId";
  static String setPaymentForSavedCard =
      '$_baseUrl/payfort/order-settings-by-quote-id';
  static String payfortVault = '$_baseUrl/payfort/vault';
  static String getApplePayValidation = '$_baseUrl/mstore/applepay/validate';
  static String stcGetOtp = '$_baseUrl/stcpay/send';
  static String stcVerifyOtp = '$_baseUrl/stcpay/verfiy';
  static String getTamaraSettings(String orderId) =>
      "$_baseUrl/tamara/get-order-settings/$orderId";



  static String apiSearch(String searchText) =>
      '${AppEnvironment.baseUrl}/search/products/$searchText';

  //Payment Urls Not Used
  static String generateUrPayToken = '$_baseUrl/payment/generateToken';
  static String initUrPayPayment = '$_baseUrl/payment/initiatePayment';

  // Installments Widgets
  static String tabbyWebview(double totalValue, String languageCode) =>
      'https://checkout.tabby.ai/promos/product-page/installments/$languageCode/?price=$totalValue&currency=SAR&source=sdk&sdkType=flutter';

  static String tamaraWebview(double totalValue, String languageCode) =>
      'https://cdn.tamara.co/widget/tamara-introduction.html?lang=$languageCode&price=$totalValue&currency=SAR&countryCode=SA&colorType=default&showBorder=true&paymentType=installment&injectTemplate=false&numberOfInstallments=4&disableInstallment=false&disablePaylater=true&widgetType=product-widget';
}
