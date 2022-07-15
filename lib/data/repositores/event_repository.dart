import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class EventRepository extends GetxService {
  final analytics = FirebaseAnalytics.instance;
}
