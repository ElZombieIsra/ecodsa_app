// Add global variables to use
library globals;

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as ds;

String title = "ECODSA";

const String _kAssetsUrl = 'assets/';
const String kImagesUrl = '${_kAssetsUrl}img/';

String formatDates(String startDate, String endDate) {
  Intl.defaultLocale = "es_MX";
  ds.initializeDateFormatting();

  DateTime start = DateTime.parse(startDate);
  DateTime end = DateTime.parse(endDate);

  final checkFormat = DateFormat('MMMM');
  String lastDay = DateFormat("dd MMMM, yyyy").format(end);
  String firstDay;
  if (checkFormat.format(start) == checkFormat.format(end))
    firstDay = DateFormat('dd').format(start);
  else
    firstDay = DateFormat('dd MMMM').format(start);
  return "$firstDay - $lastDay";
}
