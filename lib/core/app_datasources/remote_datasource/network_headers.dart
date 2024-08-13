import 'dart:io';

class ApiHeaders {
  ApiHeaders._();
  static Map<String, String> getApiHeaders({
    bool withJsonContent = true,
    String? handshakeToken,
    String? accessToken,
    String? cartId,
  }) =>
      {
        if (withJsonContent) HttpHeaders.contentTypeHeader: 'application/json',
        if (accessToken != null) 'mage': 'Bearer $accessToken',
        if (handshakeToken != null)
          HttpHeaders.authorizationHeader: 'Bearer $handshakeToken',
        if (cartId != null) 'quote': 'Bearer $cartId',
      };

  // static Map<String, String> getHeadersWithAlgolia() => {
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //       "X-Algolia-API-Key": ApiConstants.algoliaApiKey,
  //       "X-Algolia-Application-Id": ApiConstants.algoliaAppId,
  //     };
}
