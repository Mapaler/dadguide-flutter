import 'dart:io';

import 'package:dadguide2/components/config/settings_manager.dart';
import 'package:dadguide2/components/utils/logging.dart';
import 'package:dadguide2/components/utils/version_info.dart';
import 'package:dadguide2/data_dadguide/tables.dart';
import 'package:dadguide2/services/device_utils.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// TODO: needs localization

/// Launches the device email client with an error mail pre-populated with monster data.
Future<void> sendMonsterErrorEmail(Monster monster) async {
  return sendErrorEmail('[Monster ${monster.monsterId}] ${monster.nameNa}');
}

/// Launches the device email client with an error mail pre-populated with dungeon data.
Future<void> sendDungeonErrorEmail(Dungeon dungeon, SubDungeon subDungeon) async {
  return sendErrorEmail('[No.${subDungeon.subDungeonId}] ${dungeon.nameNa}');
}

/// Launches the device email client with an error email.
Future<void> sendErrorEmail(String subject) async {
  var body = await _deviceInfoBody();
  body += '\n\nPlease describe the issue below:\n';
  await _sendEmailWithLogs(subject, body);
}

/// Launches the device email client with an feedback email.
Future<void> sendFeedback() async {
  // Log all the purchase details in case this is a complaint about iap.
  for (var detail in Prefs.purchaseDetails) {
    Fimber.i(detail);
  }

  var body = await _deviceInfoBody() + '\n';
  await _sendEmailWithLogs('Feedback', body);
}

/// Launches the device email client with an feedback email.
Future<void> sendOnboardingError() async {
  var info = await getVersionInfo();
  var body = '[${info.platformVersion} - ${info.projectVersion}(${info.projectCode})]\n';
  body += 'Submitting logs for an onboarding failure';
  await _sendEmailWithLogs('Onboarding issue', body);
}

Future<String> _deviceInfoBody() async {
  var info = await getVersionInfo();
  var deviceId = await getDeviceId();
  return '[${info.platformVersion} - ${info.projectVersion}(${info.projectCode} - $deviceId)]';
}

Future<void> _sendEmailWithLogs(String subject, String body) async {
  logDeviceInfo();
  var logFilePath = await _getLoggingFilePath();
  var email = Email(
    subject: subject,
    body: body,
    recipients: ['tactical0retreat@gmail.com'],
    attachmentPaths: [logFilePath],
  );
  await FlutterEmailSender.send(email);
}

/// For Android, try to copy the file out to external storage. Depending on the Android version,
/// this might be required to attach it to the email.
Future<String> _getLoggingFilePath() async {
  var logFilePath = loggingFilePath();
  if (Platform.isAndroid) {
    try {
      var logFile = File(logFilePath);
      var logFileName = basename(logFilePath);

      var externalDir = await getExternalStorageDirectory();
      await externalDir.create(recursive: true);
      var newLogFile = File('${externalDir.path}/$logFileName');

      await logFile.copy(newLogFile.path);
      logFilePath = newLogFile.path;
    } catch (ex) {
      Fimber.e('Failed to copy log file from $logFilePath');
    }
  }
  return logFilePath;
}
