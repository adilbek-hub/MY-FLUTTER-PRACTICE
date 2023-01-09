class ApiConst {
  static const String newsApiKey = '2d01e9e3d28d4189b48461be856e9655';
  static String newsApiConst(String countryCode) =>
      'https://newsapi.org/v2/everything?q=$countryCode&apiKey=$newsApiKey';
}
