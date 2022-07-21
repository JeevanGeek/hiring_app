import 'package:hiring_app/utils/strings.dart';

class TimeUtils {
  static String timeAgo(String date) {
    return '${DateTime.now().difference(DateTime.parse(date)).inHours} ${AppStrings.hoursAgo}';
  }
}
