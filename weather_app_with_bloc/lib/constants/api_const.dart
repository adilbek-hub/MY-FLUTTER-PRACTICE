class ApiConst {
  static String weatherByCityName(String name) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=41aa18abb8974c0ea27098038f6feb1b';

  static String getIcon(String iconCode, int size) {
    // чакырылган сайттын ичиндеги wn жана @${size}x иконканын размерин 4х кылуу үчүн жазылды
    return 'https://openweathermap.org/img/wn/$iconCode@${size}x.png';
  }
}
