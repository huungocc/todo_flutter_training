import 'package:intl/intl.dart';

extension StringDateTimeExtensions on String {
  /// Parse "HH:mm:ss" thành DateTime của ngày hôm nay
  DateTime toTodoTimeToday() {
    final parts = split(':');
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  /// Parse "dd/MM/yyyy" thành DateTime
  DateTime? toDateFromDDMMYYYY() {
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(this);
    } catch (_) {
      return null;
    }
  }

  /// Chuyển "HH:mm:ss" sang "hh:mm a"
  String convertTime24to12() {
    final date = DateFormat('HH:mm:ss').parse(this);
    return DateFormat('hh:mm a').format(date);
  }

  /// Chuyển "hh:mm a" sang "HH:mm:ss"
  String? convertTime12hTo24hWithSeconds() {
    try {
      final dateTime = DateFormat('hh:mm a').parse(this);
      return DateFormat('HH:mm:ss').format(dateTime);
    } catch (e) {
      return null;
    }
  }

  /// Kiểm tra thời gian đã quá hạn so với ngày date chưa
  bool isDateTimeExpired(DateTime? date) {
    if (date == null || isEmpty) return false;

    final parts = split(':');
    if (parts.length != 3) return false;

    try {
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final second = int.parse(parts[2]);

      final targetDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        hour,
        minute,
        second,
      );

      return DateTime.now().isAfter(targetDateTime);
    } catch (_) {
      return false;
    }
  }
}

extension DateTimeFormatExtensions on DateTime {
  /// Format "MMMM d, yyyy"
  String formatLongDate() => DateFormat('MMMM d, yyyy').format(this);

  /// Format "dd/MM/yyyy"
  String formatDateToDDMMYYYY() => DateFormat('dd/MM/yyyy').format(this);

  /// Format giờ theo "hh:mm a"
  String formatPickedTimeTo12h() => DateFormat('hh:mm a').format(this);

  DateTime withTime(String? time) {
    if (time == null) return this;

    final parts = time.split(':');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
    final second = parts.length > 2 ? int.tryParse(parts[2]) ?? 0 : 0;

    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
    );
  }
}
