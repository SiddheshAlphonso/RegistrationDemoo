import 'package:flutter/material.dart';
import 'package:registration_demo/Screens/OTP%20Verification/otp_verification_screen.dart';

// RegistrationPage is a StatefulWidget to handle user registration
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

// State for RegistrationPage
class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation

  // Text controllers for each input field
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Password visibility state
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Validators for each field
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    if (RegExp(r'[0-9\W]').hasMatch(value))
      return 'No digits or symbols allowed';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return null; // Email is optional
    if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter your mobile number';
    if (!RegExp(r'^[1-9][0-9]{9}$').hasMatch(value))
      return 'Enter a valid 10-digit number';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a password';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  // Submit function to validate and process registration
  void _register() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.deepPurple, // Flipkart-style color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                // First Name
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      labelText: 'First Name', border: OutlineInputBorder()),
                  validator: _validateName,
                ),
                SizedBox(height: 16),
                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      labelText: 'Last Name', border: OutlineInputBorder()),
                  validator: _validateName,
                ),
                SizedBox(height: 16),
                // Email (optional)
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email (Optional)',
                      border: OutlineInputBorder()),
                  validator: _validateEmail,
                ),
                SizedBox(height: 16),
                // Mobile Number
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      counterText: '',
                      border: OutlineInputBorder()),
                  validator: _validateMobile,
                ),
                SizedBox(height: 16),
                // Create Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 16),
                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: _validateConfirmPassword,
                ),
                SizedBox(height: 20),
                // Register Button
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    backgroundColor:
                        Colors.deepPurple, // Match Flipkart's styling
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
