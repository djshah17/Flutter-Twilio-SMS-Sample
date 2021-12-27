import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class MyTwilioSMSScreen extends StatefulWidget {
  @override
  _MyTwilioSMSScreenState createState() => _MyTwilioSMSScreenState();
}

class _MyTwilioSMSScreenState extends State<MyTwilioSMSScreen> {

  TwilioFlutter myTwilioFlutter;

  @override
  void initState() {
    myTwilioFlutter = TwilioFlutter(
        accountSid: '***************************************',
        authToken: '*************************************',
        twilioNumber: '******************');
    super.initState();
  }

  void sendTwilioSMS() async {
    myTwilioFlutter.sendSMS(toNumber: '*************', messageBody: 'Flutter Twilio SMS Test');
  }

  void getTwilioSMS() async {
    var getSMSData = await myTwilioFlutter.getSmsList();
    print(getSMSData);
    await myTwilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Twilio SMS Screen')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.redAccent, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
          child:Text('Send SMS through Twilio', style: TextStyle( color: Colors.white, fontSize: 25)),
          onPressed: sendTwilioSMS,
        ),
      ),
    );
  }
}