import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_app/components/my_button.dart';
import 'package:market_app/pages/home_page.dart';
import 'package:market_app/services/auth_service.dart';

import '../colors.dart';

class LoginPage extends StatefulWidget{
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _verificationCode;
  bool _isCodeSent = false;
  bool _isEmailSelected = false;

  void _verificationEmail() {
  String email = _emailController.text.trim();
  if (email.isEmpty) {
    showSnackBar('Please enter your email address.');
    return;
  }
  if (_isEmailValid(email)) {
    _sendVerificationEmail(email);
    _isCodeSent = true;
  } else {
    showSnackBar("Please enter a valid email address.");
  }
}

bool _isEmailValid(String email) {
  String pattern = r'^[^@]+@[^@]+\.[^@]+';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

void _checkAndAddUser(String email) async {
  try {
    // Reference to the collection where emails are stored
    CollectionReference emails = _firestore.collection('emails');
    // Check if the email already exists
    QuerySnapshot querySnapshot = await emails.where('email', isEqualTo: email).get();
    
    if (querySnapshot.docs.isEmpty) {
      await emails.add({'email': email});//  Email does not exist, add it to Firestore
    }
    
    //await _storeVerificationCode(email, verificationCode);
  } catch (error) {
    showSnackBar("Error checking or adding email: $error");
  }
}
void _sendVerificationEmail(String email)  {
  _verificationCode = _generateVerificationCode();
  sendVerificationEmail(email, _verificationCode!);
  _isCodeSent = true;
  showSnackBar("send email");
}
String _generateVerificationCode() {
  var rng = Random();
  return rng.nextInt(900000).toString().padLeft(6, '0'); // Generates a 6-digit code
}
void _verifyCode(String email, String enteredCode){
      // Check if the code matches and is within a valid time frame (e.g., 5 minutes)

      if (_verificationCode == enteredCode) {
        showSnackBar("Verification successful!");
        // Proceed with the next step, e.g., authentication or account activation
      } else {
        showSnackBar("Invalid or expired code");
      }
}

// bool _isCodeValid() {
//   DateTime expiry = timestamp.toDate().add(Duration(minutes: 5));
//   return DateTime.now().isBefore(expiry);
// }

void showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/images/latte.png", height: 100),
              SizedBox(height: 24),
              Text("Hi, Welcome!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              SizedBox(height: 8),
              Text("Enter email or phone number to enter"),
              SizedBox(height: 16),
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("phone"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("email"),
                  ),

                ], 
                isSelected: [_isEmailSelected == false, _isEmailSelected == true],
                onPressed: (index) {
                  setState(() {
                    _isEmailSelected = index == 1;
                    _isCodeSent = false;
                  });
                },
              ),
              SizedBox(height: 16),
             if (!_isEmailSelected) ...[
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'phone',
                    prefixText: '+972',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ] else ...[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText:'email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
              SizedBox(height: 10,),
               const SizedBox(height: 16),
              if (!_isCodeSent) ...[
                MyButton(
                  text: _isEmailSelected ? "שלחו לי קוד אימות במייל" : "שלחו לי קוד אימות",
                  onTap: _sendVerificationEmail ,
                ),
              ] else ...[
                Text(
                  _isEmailSelected ? "שלחנו לך קוד אימות למייל" : "שלחנו לך קוד אימות לטלפון",
                  style: TextStyle(color: Colors.brown),
                ),
                const SizedBox(height: 8),
                Text(
                  _isEmailSelected ? _emailController.text : _phoneController.text,
                  style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: 'קוד אימות',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.brown),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                MyButton(
                  text: "אישור",
                  onTap: _isEmailSelected ? _signInWithEmailCode : _signInWithSMSCode,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}