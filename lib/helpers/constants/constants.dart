import 'package:pokedex/helpers/size_config/size_config.dart';


double kColPadding = ScreenSize.height * 0.05;
double kRowPadding = ScreenSize.width * 0.05;

double kImageSize = ScreenSize.width * 0.1;

const double kFontSize = 13.0;
const double kIconSize = 22.0;

//WebView User Agent
const String webViewUserAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36';

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp phoneValidatorRegExp =
    RegExp(r'^([0-9]{9})|([A-Za-z0-9._%\+\-]+@[a-z0-9.\-]+\.[a-z]{2,3})$');

final RegExp stringIsUrlRegExp = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');

//SignUp Form Error
const String kEmailNullError = 'Please enter your email';
const String kInvalidEmailError = 'Please enter Valid Email';
const String kPassNullError = 'Please enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kInvaliedInfoError = 'Email or Password Invalied';
const String kFirstNameNullError = 'Please enter your first name';
const String kLastNameNullError = 'Please enter your last name';
const String kPhoneNumberNullError = 'Please enter your phone number';
const String kInvaliedPhoneNumberError = 'Please enter valid phone number';
const String kAddressNullError = 'Please enter your address';
const String kCountryNullError = 'Please select your Country';
const String kStateNullError = 'Please select your state';
