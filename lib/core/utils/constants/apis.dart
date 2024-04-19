// ------------------------------------------------

class Api {
  static final String baseUrl = "http://testpage.hamropahal.org/api/rms";

  // php artisan serve --host=192.168.0.7 --port=7855
  static final String imageUrl = "$baseUrl/uploads/";

  // static const String prefix = "/api/v1";
  static const String auth = "/auth";
// auth
  static final String signupUrl = "$baseUrl$auth/register";

  static final String loginUrl = "$baseUrl$auth/login";
  static final String forgotPassword = "$baseUrl$auth/forgot-password";
  static final String verifyOTP = "$baseUrl$auth/verify-otp";
  static final String resetPassword = "$baseUrl$auth/reset-password";
  static final String changePw = "$baseUrl$auth/change-password";

  // --------------
  static final String getCategories = "$baseUrl/product-categories";
  static final String getAllProducts = "$baseUrl/products";
  static final String searchProducts =
      "$baseUrl/search-products?search_term=#keyword#";

  static final String productsByCategoryId =
      "$baseUrl/products-by-category?id=#id#";

  static final String getProductById = "$baseUrl/products-by-id";

  //cafe menu
  static final String menu = "$baseUrl/menu";
  static final String tables = "$baseUrl/tables";
  static final String tableReservation = "$baseUrl/tables/reservation";
  static final String getAvailableReservationTables =
      "$baseUrl/tables/available";

  // cart

  static final String cart = "$baseUrl/cart";
  static final String addToCart = "$baseUrl/add-to-cart";
  static final String deleteCartItem = "$baseUrl/delete-cart-item";
  static final String updateCartItem = "$baseUrl/update-cart-item";

//order
  static final String checkout = "$baseUrl/checkout";
  static final String orders = "$baseUrl/orders";
  static final String getMyReservedTables = "$baseUrl/my-reserved-tables";

  static final String unreserve = "$baseUrl/tables/unreserve";
}


// ----------------------------------------------




// class Api {
//   static final String baseUrl = "http://testpage.hamropahal.org/api/rms";

//   // php artisan serve --host=192.168.0.7 --port=7855
//   static final String imageUrl = "$baseUrl/uploads/";

//   static const String prefix = "/api/v1";
//   static const String auth = "/auth";
// // auth
//   static final String signupUrl = "$baseUrl$prefix$auth/register";

//   static final String loginUrl = "$baseUrl$prefix$auth/login";
//   static final String forgotPassword = "$baseUrl$prefix$auth/forgot-password";
//   static final String verifyOTP = "$baseUrl$prefix$auth/verify-otp";
//   static final String resetPassword = "$baseUrl$prefix$auth/reset-password";
//   static final String changePw = "$baseUrl$prefix$auth/change-password";

//   // --------------
//   static final String getCategories = "$baseUrl$prefix/product-categories";
//   static final String getAllProducts = "$baseUrl$prefix/products";
//   static final String searchProducts =
//       "$baseUrl$prefix/search-products?search_term=#keyword#";

//   // static final String searchCafeProducts =
//   //     "$baseUrl$prefix/search-products?search_term=perry";
//   static final String productsByCategoryId =
//       "$baseUrl$prefix/products-by-category?id=#id#";

//   // static final String getProductById =
//   //     "$baseUrl/products-by-id?id=#id#";

//   static final String getProductById = "$baseUrl$prefix/products-by-id";

//   //cafe menu
//   static final String menu = "$baseUrl$prefix/menu";
//   static final String tables = "$baseUrl$prefix/tables";
//   static final String tableReservation = "$baseUrl$prefix/tables/reservation";
//   static final String getAvailableReservationTables =
//       "$baseUrl$prefix/tables/available";

//   // cart

//   static final String cart = "$baseUrl$prefix/cart";
//   static final String addToCart = "$baseUrl$prefix/add-to-cart";
//   static final String deleteCartItem = "$baseUrl$prefix/delete-cart-item";
//   static final String updateCartItem = "$baseUrl$prefix/update-cart-item";

// //order
//   static final String checkout = "$baseUrl$prefix/checkout";
//   static final String orders = "$baseUrl$prefix/orders";
//   static final String getMyReservedTables =
//       "$baseUrl$prefix/my-reserved-tables";

//   static final String unreserve = "$baseUrl$prefix/tables/unreserve";
// }



// --------------------------------------------