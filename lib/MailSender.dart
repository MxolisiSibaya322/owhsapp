import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';



String errMessageMailSender = "";
Future<void> sendVerificationCode(String email, String verificationCode) async {
  String username = 'owhsapp@gmail.com';
  String password = 'qqdluvaqipyjmpfz';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, "ORLANDO WEST HIGH SCHOOL APP")
    ..recipients.add(email)
    ..subject = 'Verification Code'
    ..text =
        'Welcome to the Orlando West High internal APP\n\nYour verification code is: $verificationCode';

  try {
    await send(message, smtpServer);
  } catch (e) {
    errMessageMailSender =
        'Error occurred while sending verification email: $e';
  }
}
