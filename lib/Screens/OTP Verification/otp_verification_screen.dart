import 'package:flutter/material.dart';
import 'package:registration_demo/Screens/Login%20Screen/login_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();

  // Static OTP for verification
  final String _staticOtp = '123456'; // Add the static OTP here

  // Method to validate OTP
  void _validateOtp() {
    String otp = _otpController.text;
    if (otp.length == 6) {
      // Check if entered OTP matches the static OTP
      if (otp == _staticOtp) {
        // OTP is valid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP Verified Successfully!')),
        );
        // Navigate to the next screen or perform an action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        // OTP is invalid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP, please try again')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        backgroundColor: Colors.deepPurple, // Match Flipkart's styling
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the 6-digit OTP sent to your mobile number',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateOtp,
              child: Text('Verify OTP'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50),
                backgroundColor: Colors.deepPurple, // Match Flipkart's styling
              ),
            ),
          ],
        ),
      ),
    );
  }
}
