import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ Import this
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginScreen({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpEnabled = false;

  void _sendOtp() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        _isOtpEnabled = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP sent successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please enter your email or mobile number.")),
      );
    }
  }

  void _login() async {
    if (_otpController.text.length == 6) {
      // ✅ Save email in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', _emailController.text);

      widget.onLoginSuccess();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(isFirstLogin: true)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Invalid OTP. Please enter a 6-digit OTP.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Image.asset(
                  "assets/logo.jpg",
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Login now to find what's happening around you",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              _buildTextField(
                  _emailController,
                  "Email address or mobile number",
                  TextInputType.emailAddress,
                  true),
              const SizedBox(height: 15),
              _buildTextField(_otpController, "Enter OTP", TextInputType.number,
                  _isOtpEnabled),
              const SizedBox(height: 20),
              _buildLoginButton(),
              const SizedBox(height: 15),
              _buildOtpButton(),
              const SizedBox(height: 25),
              const Text("or",
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
              const SizedBox(height: 15),
              _buildSocialMediaIcons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      TextInputType type, bool enabled) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      keyboardType: type,
      enabled: enabled,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: _isOtpEnabled ? _login : null,
      child: const Text("Login",
          style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  Widget _buildOtpButton() {
    return TextButton(
      onPressed: _sendOtp,
      child: const Text("Send OTP",
          style: TextStyle(color: Colors.purple, fontSize: 16)),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton("assets/instagram.png"),
        const SizedBox(width: 20),
        _socialButton("assets/facebook.png"),
        const SizedBox(width: 20),
        _socialButton("assets/twitter.png"),
      ],
    );
  }

  Widget _socialButton(String asset) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Feature coming soon!")),
        );
      },
      child: Image.asset(asset, height: 40),
    );
  }
}
