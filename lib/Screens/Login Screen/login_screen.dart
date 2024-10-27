import 'package:flutter/material.dart';
import 'package:registration_demo/Screens/Home%20Screen/home_screen.dart';
import 'package:registration_demo/Screens/Registration%20Screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _imagePath = 'assets/LoginScreen/image2.png';

  void _changeImage() {
    setState(() {
      if (_imagePath == 'assets/LoginScreen/image1.png') {
        _imagePath = 'assets/LoginScreen/image2.png';
      } else if (_imagePath == 'assets/LoginScreen/image2.png') {
        _imagePath = 'assets/LoginScreen/image3.png';
      } else {
        _imagePath = 'assets/LoginScreen/image1.png';
      }
    });
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!RegExp(r'^[1-9][0-9]{0,9}$').hasMatch(value)) {
      return 'Mobile number must not start with 0 and should be 10 digits';
    }
    if (value.length != 10) {
      return 'Mobile number must be exactly 10 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    String? error = _checkEmpty(value);
    if (error != null) return error;

    error = _checkLength(value);
    if (error != null) return error;

    error = _checkComplexity(value);
    return error;
  }

  String? _checkEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? _checkLength(String? value) {
    if (value != null && value.length != 6) {
      return 'Invalid password';
    }
    return null;
  }

  String? _checkComplexity(String? value) {
    String? digitError = _checkDigit(value);
    if (digitError != null) return digitError;

    String? uppercaseError = _checkUppercase(value);
    if (uppercaseError != null) return uppercaseError;

    String? specialCharError = _checkSpecialCharacter(value);
    return specialCharError;
  }

  String? _checkDigit(String? value) {
    if (value != null && !RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least 1 digit';
    }
    return null;
  }

  String? _checkUppercase(String? value) {
    if (value != null && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain 1 uppercase';
    }
    return null;
  }

  String? _checkSpecialCharacter(String? value) {
    if (value != null && !RegExp(r'[\W_]').hasMatch(value)) {
      return 'Password must contain 1 symbol';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.grey),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 27),
              GestureDetector(
                onTap: _changeImage,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mobileController,
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Enter your mobile number',
                        border: inputBorder,
                        prefixIcon: Icon(Icons.phone, color: primaryColor),
                        counterText: '',
                      ),
                      validator: _validateMobile,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      maxLength: 6,
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        border: inputBorder,
                        prefixIcon: Icon(Icons.lock, color: primaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 20),
                    // Curved Login Button
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Curved corners
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot password ?');
                          },
                          child: Text('Forgot password'),
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
                          },
                          child: Text('Create account'),
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
