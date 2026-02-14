import 'package:firebase_core/firebase_core.dart';
import 'package:wasl_company_app/core/notifications_service/firebase_messaging_service.dart';
import 'package:wasl_company_app/core/notifications_service/local_notifications_service.dart';
import 'package:wasl_company_app/firebase_options.dart';

Future<void> notificationsInit() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final localNotificationsService = LocalNotificationsService.instance();
  await localNotificationsService.init();

  final firebaseMessagingService = FirebaseMessagingService.instance();
  await firebaseMessagingService.init(
    localNotificationsService: localNotificationsService,
  );
}
