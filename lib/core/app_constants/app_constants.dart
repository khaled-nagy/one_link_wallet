import 'package:one_link_wallet/core/app_datasources/local_datasource/sqlite_helper/sqlite_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstants {
  const AppConstants._();



  static const int paginationPageSize = 12;

  static const String defaultShippingMethod = 'flatrate';

  static const List<String> productCardSelectItems = [
    'sku',
    'name',
    '_media_',
    'prices_with_tax',
    'stock',
    'category',
    'has_options',
  ];

  static Map<String, DatabaseType> productCardSqliteColumns = {
    'sku': DatabaseType.TEXT,
    'name': DatabaseType.TEXT,
    'images': DatabaseType.TEXT,
    'original_price': DatabaseType.REAL,
    'discount_price': DatabaseType.REAL,
    'is_in_stock': DatabaseType.INTEGER,
    'qty': DatabaseType.INTEGER,
    'category': DatabaseType.TEXT,
    'has_options': DatabaseType.INTEGER,
  };

  static Map<String, DatabaseType> notificationsSqliteColumns = {
    'title': DatabaseType.TEXT,
    'body': DatabaseType.TEXT,
    'date': DatabaseType.TEXT,
    'type': DatabaseType.TEXT,
    'id_or_url': DatabaseType.TEXT,
  };

  static const String plpFilterTag = 'plp_filter';
  static const String searchFilterTag = 'search_filter';

  static const double defaultReviewValueIfNull = 0;

  static const Size productItemSize = Size(172, 210);

  static const ourEmail = 'mailto://info@backcomfort.com.sa';
  static const ourPhoneNumber = 'tel://920000440';
  static const whatsappUrl = 'https://api.whatsapp.com/send?phone=966112228227';

}
