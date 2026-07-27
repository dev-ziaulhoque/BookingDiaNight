// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import '../../config/flavor_config.dart';

class EndPoint {
  static String get BASE_URL =>
      AppConfig.isProduction ? AppConfig.baseUrl : AppConfig.localBaseUrl;

  // ─── Auth ───────────────────────────────────────────────────────────────────
  static const String CREATE_ACCOUNT = '/auth/signup';
  static const String VERIFY_EMAIL = '/auth/verify';
  static const String RESEND_OTP = '/auth/resend';
  static const String LOGIN = '/auth/login';
  static const String GOOGLE_LOGIN = '/auth/google';
  static const String REFRESH_TOKEN = '/auth/refresh-token';
  static const String CHECK_AUTH = '/auth/check';
  static const String LOGOUT = '/auth/logout'; // Implemented

  // ─── Forgot / Recover Password ──────────────────────────────────────────────
  static const String FORGOT_PASSWORD = '/auth/recover/find';
  static const String FORGOT_PASSWORD_VERIFY = '/auth/recover/verify';
  static const String FORGOT_PASSWORD_RESEND = '/auth/recover/resend';
  static const String RESET_PASSWORD = '/auth/recover/reset';

  // ─── Social Register (merchant / organizer / DJ) ────────────────────────────
  static const String SOCIAL_REGISTER = '/social/register';
  static const String SOCIAL_VERIFY_EMAIL = '/social/verify-email';

  // ─── Profile ────────────────────────────────────────────────────────────────
  static const String PROFILE = '/profile'; // Implemented
  static const String CHANGE_PASSWORD = '/profile/password'; // Implemented

  // ─── Image ──────────────────────────────────────────────────────────────────
  static const String IMAGE = '/image'; // Implemented

  // ─── Country ────────────────────────────────────────────────────────────────
  static const String COUNTRY = '/country'; // Implemented

  // ─── Legal ──────────────────────────────────────────────────────────────────
  // Query params: targetRole (user|organizer|merchant), contentType (privacy|terms|about|mission)
  static const String LEGAL = '/legal';

  // ─── Category ───────────────────────────────────────────────────────────────
  static const String CATEGORY = '/category'; // Implemented
  static const String SUB_CATEGORY = '/subcategory'; // Implemented

  // ─── Product Category ───────────────────────────────────────────────────────
  static const String PRODUCT_CATEGORY = '/product-category'; // Implemented

  // ─── Business ───────────────────────────────────────────────────────────────
  static const String BUSINESS = '/business'; // Implemented
  static const String BUSINESS_ME = '/business/me';
  // GET/PATCH /business/:id  → '$BUSINESS/$id'
  // POST /business/:id/keep-active → '$BUSINESS/$id/keep-active'

  // ─── Business Profile ───────────────────────────────────────────────────────
  static const String BUSINESS_PROFILE_ME = '/business-profile/me';
  // GET /business-profile/:id → '/business-profile/$id'
  static const String BUSINESS_PROFILE = '/business-profile'; // Implemented

  // ─── Merchant ───────────────────────────────────────────────────────────────
  static const String MERCHANT = '/merchant'; // Implemented
  static const String MERCHANT_ME = '/merchant/me';
  static const String MERCHANT_ANALYTICS = '/merchant/analytics';
  // GET/PATCH /merchant/:id → '$MERCHANT/$id'

  // ─── Product ────────────────────────────────────────────────────────────────
  static const String PRODUCTS = '/products'; // Implemented
  static const String PRODUCT = PRODUCTS;
  // GET/PATCH/DELETE /product/:id → '$PRODUCT/$id'

  // ─── Order ──────────────────────────────────────────────────────────────────
  static const String ORDER = '/order';
  static const String ORDER_MY_ORDERS = '/order/me'; // Implemented
  static const String ORDER_MERCHANT = '/order/merchant';
  // GET /order/:id          → '$ORDER/$id'
  // PATCH /order/:id/status → '$ORDER/$id/status'

  // ─── Cart ───────────────────────────────────────────────────────────────────
  static const String CART = '/cart'; // Implemented
  static const String CART_ADD = CART;
  static const String CART_ITEM = CART;
  static const String CART_CHECKOUT = '/order/checkout';
  // PATCH/DELETE /cart/:itemId → '$CART/$itemId'

  // ─── Favorite ───────────────────────────────────────────────────────────────
  static const String FAVORITE = '/favorite'; // Implemented
  static const String FAVORITE_TOGGLE = FAVORITE;

  // ─── Follow ─────────────────────────────────────────────────────────────────
  static const String FOLLOW_TOGGLE = '/follow/toggle';
  static const String FOLLOW_STATUS = '/follow/status';

  // ─── Review ─────────────────────────────────────────────────────────────────
  static const String REVIEW = '/review'; // Implemented
  // GET  /review/target/:targetId → '$REVIEW/target/$targetId'
  // POST /review/:id/reply        → '$REVIEW/$id/reply'
  // POST /review/:id/report       → '$REVIEW/$id/report'

  // ─── Subscription ───────────────────────────────────────────────────────────
  static const String SUBSCRIPTION_SYNC = '/subscription/sync';
  static const String SUBSCRIPTION_ME = '/subscription/me';
  static const String SUBSCRIPTION_CANCEL = '/subscription/cancel';

  // ─── Subscription Plan ──────────────────────────────────────────────────────
  static const String SUBSCRIPTION_PLAN = '/subscription-plan';
  // GET /subscription-plan/:id → '$SUBSCRIPTION_PLAN/$id'

  // ─── Transaction ────────────────────────────────────────────────────────────
  static const String TRANSACTION_ME = '/transaction/me';
  static const String TRANSACTION_WITHDRAW = '/transaction/withdraw';

  // ─── Wallet ─────────────────────────────────────────────────────────────────
  static const String WALLET_ME = '/wallet/me';
  static const String WALLET_CONNECT_STRIPE = '/wallet/connect-stripe';

  // ─── Contact ────────────────────────────────────────────────────────────────
  static const String CONTACT = '/contact';

  // ─── Notifications ──────────────────────────────────────────────────────────
  static const String GET_NOTIFICATIONS = '/notifications/history';

  // ─── Account ────────────────────────────────────────────────────────────────
  static const String SWITCH_ACCOUNT = '/users/account-switch'; // Implemented

  /// ─── Merchant ────────────────────────────────────────────────────────────────
  static const String getMerchantProfile = '/merchant/me';
  static const String createMerchantProfile = '/merchant/me';

  static String withId(String endpoint, String id) => '$endpoint/$id';
  static String status(String endpoint, String id) => '$endpoint/$id/status';
}