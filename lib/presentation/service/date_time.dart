import 'package:intl/intl.dart';

/// Date helpers. Patterns follow intl DateFormat, for example
/// 'dd MMM, yyyy', 'yyyy-MM-dd', 'hh:mm a'.
class DateTimeService {
  DateTime getDateFromString({required String dateString, required String format}) {
    return DateFormat(format).parse(dateString);
  }

  String getStringFromDate({required DateTime date, required String pattern}) {
    return DateFormat(pattern).format(date);
  }

  DateTime getDateFromMillis({required int millis}) => DateTime.fromMillisecondsSinceEpoch(millis);

  String changeDateStringFormat({
    required String dateString,
    required String inputPattern,
    required String outputPattern,
  }) {
    return DateFormat(outputPattern).format(DateFormat(inputPattern).parse(dateString));
  }

  /// Converts a UTC date string from server to local time string.
  String utcToLocal({required String dateString, required String inputPattern, String? outputPattern}) {
    final utc = DateFormat(inputPattern).parseUtc(dateString);
    return DateFormat(outputPattern ?? inputPattern).format(utc.toLocal());
  }

  /// Converts a local date string to UTC string for server.
  String localToUtc({required String dateString, required String inputPattern, String? outputPattern}) {
    final local = DateFormat(inputPattern).parse(dateString);
    return DateFormat(outputPattern ?? inputPattern).format(local.toUtc());
  }

  /// 125 -> "02:05"
  String secondsToMinSec(int seconds) {
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  bool isFutureDate(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day).isAfter(DateTime(now.year, now.month, now.day));
  }

  String timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays >= 365) return _plural(diff.inDays ~/ 365, 'year');
    if (diff.inDays >= 30) return _plural(diff.inDays ~/ 30, 'month');
    if (diff.inDays >= 7) return _plural(diff.inDays ~/ 7, 'week');
    if (diff.inDays >= 1) return _plural(diff.inDays, 'day');
    if (diff.inHours >= 1) return _plural(diff.inHours, 'hour');
    if (diff.inMinutes >= 1) return _plural(diff.inMinutes, 'minute');
    return 'Just now';
  }

  String _plural(int value, String unit) => '$value $unit${value == 1 ? '' : 's'} ago';
}
