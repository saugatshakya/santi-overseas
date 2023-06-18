
import 'package:universal_html/html.dart' as html;

const String phoneType = "phone";

const String desktopType = "desktop";

String getSmartPhoneOrTablet() {
  final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  // smartphone
  if (userAgent.contains("iphone") || userAgent.contains("android")) {
    return phoneType;
  }
  // tablet
  else {
    return desktopType;
  }
}
