import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'booking_page.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 2;
  String userName = "User";
  String userEmail = "example@gmail.com"; // Default email

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // Load user email & name from SharedPreferences
  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('user_email');

    if (email != null && email.contains("@")) {
      setState(() {
        userEmail = email;
        userName = email.split("@")[0]; // Extract name before '@'
      });
    }
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = HomePage();
        break;
      case 1:
        nextPage = BookingPage();
        break;
      case 2:
        return;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Logo
          SizedBox(
            width: 200,
            child: Image.asset("assets/logo.jpg"), // Replace with your logo
          ),
          SizedBox(height: 20),

          // Profile Section
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 209, 93, 236), // Light pink background
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(221, 255, 255, 255)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Account Options
          _buildOptionButton("Basic Information"),
          _buildOptionButton("Account Details"),
          _buildOptionButton("Preference & Settings"),
          _buildOptionButton("Payment & Subscriptions"),

          SizedBox(height: 30),
          Text("Follow on",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialButton("assets/instagram.png"),
              SizedBox(width: 20),
              _socialButton("assets/facebook.png"),
              SizedBox(width: 20),
              _socialButton("assets/twitter.png"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  // Function to build pink option buttons
  Widget _buildOptionButton(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 209, 75, 226),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 12),
            minimumSize: Size(250, 50)),
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Social media button
  Widget _socialButton(String assetPath) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Feature coming soon!")),
        );
      },
      child: Image.asset(assetPath, height: 40),
    );
  }
}
