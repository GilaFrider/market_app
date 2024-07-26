import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

final SmtpServer = gmail("g0548457103@gmail.com", "mjdr ibfp rojk icbz");

Future<void> sendEmail(String email, String subject, String text)async {
  final message = Message()
  ..from = Address("g0548457103@gmail.com", "Coffee App")
  ..recipients.add(email)
  ..subject = subject
  ..text = text;

  try{
    final SendReport = await send(message, SmtpServer);
  } on MailerException catch(e){
    for(var p in e.problems){
      print("Problem: ${p.code}: ${p.msg}");
    }
  }
}

Future<void> sendVerificationEmail(String email, String code) async{
  print("send email");
  await sendEmail(email, "Verification Code", "Your Verification Code is: $code");
}

Future<void> sendOrderEmail(String email, String orderDetails, String total) async{
  await sendEmail(email, "Your Order Details", "Order details:\n$orderDetails\n$total");
}